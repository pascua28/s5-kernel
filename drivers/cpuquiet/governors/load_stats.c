/*
 * Copyright (C) 2013 maxwen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * Author: maxwen
 *
 * load_stats based cpuquiet governor
 * uses load status to hotplug cpus
 * uses also rq_stats to detect situations with lots of threads
 * but low load
 */

#include <linux/kernel.h>
#include <linux/cpuquiet.h>
#include <linux/cpumask.h>
#include <linux/module.h>
#include <linux/jiffies.h>
#include <linux/slab.h>
#include <linux/cpu.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/kernel_stat.h>
#include <linux/tick.h>

// from cpuquiet_driver.c
extern unsigned int cpq_max_cpus(void);
extern unsigned int cpq_min_cpus(void);
extern bool cpq_is_suspended(void);

typedef enum {
	DISABLED,
	IDLE,
	DOWN,
	UP,
} LOAD_STATS_STATE;

static struct delayed_work load_stats_work;
static struct kobject *load_stats_kobject;

/* configurable parameters */
static unsigned int sample_rate = 70;		/* msec */
static unsigned int start_delay = 20000;
static LOAD_STATS_STATE load_stats_state;
static struct workqueue_struct *load_stats_wq;

static unsigned int load_threshold[8] = {80, 70, 70, 60, 60, 50, 50, 40};
static unsigned int twts_threshold[8] = {70, 0, 70, 120, 70, 120, 0, 120};

extern unsigned int get_rq_info(void);

static u64 input_boost_end_time = 0;
static bool input_boost_running = false;
static unsigned int input_boost_duration = 3 * 70; /* ms */
static unsigned int input_boost_cpus = 2;
static unsigned int input_boost_enabled = true;
static bool input_boost_task_alive = false;
static struct task_struct *input_boost_task;

static unsigned int rq_depth_threshold = 40;
static unsigned int rq_depth_load_threshold = 70;
static unsigned int rq_depth_cpus_threshold = 4;

static bool first_call = true;
static u64 total_time;
static u64 last_time;

DEFINE_MUTEX(load_stats_work_lock);

struct cpu_load_data {
	u64 prev_cpu_idle;
	u64 prev_cpu_wall;
	u64 prev_cpu_iowait;
	u64 prev_cpu_nice;
};

/* Consider IO as busy */
static bool io_is_busy = false;
static bool ignore_nice = true;

static DEFINE_PER_CPU(struct cpu_load_data, cpuload);

static bool log_hotplugging = false;
#define hotplug_info(msg...) do { \
	if (log_hotplugging) pr_info("[LOAD_STATS]: " msg); \
	} while (0)

static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
{
	u64 idle_time;
	u64 cur_wall_time;
	u64 busy_time;

	cur_wall_time = jiffies64_to_cputime64(get_jiffies_64());

	busy_time  = kcpustat_cpu(cpu).cpustat[CPUTIME_USER];
	busy_time += kcpustat_cpu(cpu).cpustat[CPUTIME_SYSTEM];
	busy_time += kcpustat_cpu(cpu).cpustat[CPUTIME_IRQ];
	busy_time += kcpustat_cpu(cpu).cpustat[CPUTIME_SOFTIRQ];
	busy_time += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
	busy_time += kcpustat_cpu(cpu).cpustat[CPUTIME_NICE];

	idle_time = cur_wall_time - busy_time;
	if (wall)
		*wall = jiffies_to_usecs(cur_wall_time);

	return jiffies_to_usecs(idle_time);
}

static inline u64 get_cpu_idle_time(unsigned int cpu, u64 *wall)
{
	u64 idle_time = get_cpu_idle_time_us(cpu, NULL);

	if (idle_time == -1ULL)
		return get_cpu_idle_time_jiffy(cpu, wall);
	else
		idle_time += get_cpu_iowait_time_us(cpu, wall);

	return idle_time;
}

static inline u64 get_cpu_iowait_time(unsigned int cpu,
							u64 *wall)
{
	u64 iowait_time = get_cpu_iowait_time_us(cpu, wall);

	if (iowait_time == -1ULL)
		return 0;

	return iowait_time;
}

static unsigned int calc_cur_load(unsigned int cpu)
{
	struct cpu_load_data *pcpu = &per_cpu(cpuload, cpu);
	u64 cur_wall_time, cur_idle_time, cur_iowait_time;
	unsigned int idle_time, wall_time, iowait_time;

	cur_idle_time = get_cpu_idle_time(cpu, &cur_wall_time);
	cur_iowait_time = get_cpu_iowait_time(cpu, &cur_wall_time);

	wall_time = (unsigned int) (cur_wall_time - pcpu->prev_cpu_wall);
	pcpu->prev_cpu_wall = cur_wall_time;

	idle_time = (unsigned int) (cur_idle_time - pcpu->prev_cpu_idle);
	pcpu->prev_cpu_idle = cur_idle_time;

	iowait_time = (unsigned int) (cur_iowait_time - pcpu->prev_cpu_iowait);
	pcpu->prev_cpu_iowait = cur_iowait_time;

	if (ignore_nice) {
		u64 cur_nice;
		unsigned long cur_nice_jiffies;

		cur_nice = kcpustat_cpu(cpu).cpustat[CPUTIME_NICE] - pcpu->prev_cpu_nice;
		cur_nice_jiffies = (unsigned long) cputime64_to_jiffies64(cur_nice);

		pcpu->prev_cpu_nice = kcpustat_cpu(cpu).cpustat[CPUTIME_NICE];

		idle_time += jiffies_to_usecs(cur_nice_jiffies);
	}

	if (io_is_busy && idle_time >= iowait_time)
		idle_time -= iowait_time;

	if (unlikely(!wall_time || wall_time < idle_time))
		return 0;

	return 100 * (wall_time - idle_time) / wall_time;
}

static unsigned int report_load(void)
{
	int cpu;
	unsigned int cur_load = 0;
	
	for_each_online_cpu(cpu) {
		cur_load += calc_cur_load(cpu);
	}
	cur_load /= num_online_cpus();
  	
	return cur_load;
}

static unsigned int get_lightest_loaded_cpu_n(void)
{
	unsigned long min_avg_runnables = ULONG_MAX;
	unsigned int cpu = nr_cpu_ids;
	int i;

	for_each_online_cpu(i) {
		unsigned int nr_runnables = get_avg_nr_running(i);

		if (i > 0 && min_avg_runnables > nr_runnables) {
			cpu = i;
			min_avg_runnables = nr_runnables;
		}
	}

	return cpu;
}

static void update_load_stats_state(void)
{
	unsigned int rq_depth;
	unsigned int load;
	unsigned int nr_cpu_online;
	unsigned int max_cpus = cpq_max_cpus();
	unsigned int min_cpus = cpq_min_cpus();
	u64 current_time;
	u64 this_time = 0;
	int index;
		
	if (load_stats_state == DISABLED)
		return;

	current_time = ktime_to_ms(ktime_get());
	if (current_time <= start_delay){
		load_stats_state = IDLE;
		return;
	}

	if (first_call) {
		first_call = false;
	} else {
		this_time = current_time - last_time;
	}
	total_time += this_time;
	load = report_load();
	rq_depth = get_rq_info();
	nr_cpu_online = num_online_cpus();
	load_stats_state = IDLE;

	if (nr_cpu_online) {
		index = (nr_cpu_online - 1) * 2;
		if ((nr_cpu_online < CONFIG_NR_CPUS) && (load >= load_threshold[index])) {
			if (total_time >= twts_threshold[index]) {
           		if (nr_cpu_online < max_cpus){
           			hotplug_info("UP load=%d total_time=%lld load_threshold[index]=%d twts_threshold[index]=%d nr_cpu_online=%d min_cpus=%d max_cpus=%d\n", load, total_time, load_threshold[index], twts_threshold[index], nr_cpu_online, min_cpus, max_cpus);
           	    	load_stats_state = UP;
           	    }
			}
		} else if (load <= load_threshold[index+1]) {
			if (total_time >= twts_threshold[index+1] ) {
           		if ((nr_cpu_online > 1) && (nr_cpu_online > min_cpus)){
           			hotplug_info("DOWN load=%d total_time=%lld load_threshold[index+1]=%d twts_threshold[index+1]=%d nr_cpu_online=%d min_cpus=%d max_cpus=%d\n", load, total_time, load_threshold[index+1], twts_threshold[index+1], nr_cpu_online, min_cpus, max_cpus);
                   	load_stats_state = DOWN;
                }
			}
		} else {
			load_stats_state = IDLE;
			total_time = 0;
		}
	} else {
		total_time = 0;
	}

	if (rq_depth > rq_depth_threshold 
			&& load < rq_depth_load_threshold 
			&& nr_cpu_online < rq_depth_cpus_threshold 
			&& load_stats_state != UP 
			&& nr_cpu_online < max_cpus){
		hotplug_info("UP because of rq_depth %d load %d\n", rq_depth, load);
		load_stats_state = UP;
	}

	if (input_boost_running && current_time > input_boost_end_time)
		input_boost_running = false;

	if (input_boost_running){
		if (load_stats_state != UP){
			load_stats_state = IDLE;
			hotplug_info("IDLE because of input boost\n");
		}
	}
	
	if (load_stats_state != IDLE)
		total_time = 0;

	last_time = ktime_to_ms(ktime_get());
}

static bool __load_stats_work_func(void)
{
	bool up = false;
	bool sample = false;
	unsigned int cpu = nr_cpu_ids;

	switch (load_stats_state) {
	case DISABLED:
		break;
	case IDLE:
		sample = true;
		break;
	case UP:
		cpu = cpumask_next_zero(0, cpu_online_mask);
		up = true;
		sample = true;
		break;
	case DOWN:
		cpu = get_lightest_loaded_cpu_n();
		sample = true;
		break;
	default:
		pr_err("%s: invalid cpuquiet runnable governor state %d\n",
			__func__, load_stats_state);
		break;
	}

	if (cpu < nr_cpu_ids) {
		if (up)
			cpuquiet_wake_cpu(cpu);
		else
			cpuquiet_quiesence_cpu(cpu);
	}
	return sample;
}

static void load_stats_work_func(struct work_struct *work)
{
	bool sample = false;

	mutex_lock(&load_stats_work_lock);

	update_load_stats_state();

	sample = __load_stats_work_func();

	if (sample)
		queue_delayed_work(load_stats_wq, &load_stats_work,
				msecs_to_jiffies(sample_rate));

	mutex_unlock(&load_stats_work_lock);
}

static int load_stats_boost_task(void *data) {
	unsigned int nr_cpu_online;
	int i;
	unsigned int max_cpus;

	while (1) {
		set_current_state(TASK_INTERRUPTIBLE);
		schedule();

		if (kthread_should_stop())
			break;

		set_current_state(TASK_RUNNING);

		if (input_boost_running)
			continue;

		mutex_lock(&load_stats_work_lock);
		
		input_boost_running = true;
			
		/* do boost work */
		nr_cpu_online = num_online_cpus();
		if (nr_cpu_online < input_boost_cpus){
			max_cpus = cpq_max_cpus();
			for (i = nr_cpu_online; i < input_boost_cpus; i++){
				if (i < max_cpus){
					load_stats_state = UP;
					hotplug_info("UP because of input boost\n");
					__load_stats_work_func();
				}
			}
		}
		input_boost_end_time = ktime_to_ms(ktime_get()) + input_boost_duration;
			
		mutex_unlock(&load_stats_work_lock);
	}

	hotplug_info("%s: input_boost_thread stopped\n", __func__);

	return 0;
}

static ssize_t show_twts_threshold(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%u %u %u %u %u %u %u %u\n", twts_threshold[0], twts_threshold[1], twts_threshold[2], twts_threshold[3], 
	    twts_threshold[4], twts_threshold[5], twts_threshold[6], twts_threshold[7]);

	return out - buf;
}

static ssize_t store_twts_threshold(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	int i;
    unsigned int user_twts_threshold[8] = {0, 0, 0, 0, 0, 0, 0, 0};

	ret = sscanf(buf, "%u %u %u %u %u %u %u %u", &user_twts_threshold[0], &user_twts_threshold[1], &user_twts_threshold[2] , &user_twts_threshold[3],
	    &user_twts_threshold[4], &user_twts_threshold[5], &user_twts_threshold[6], &user_twts_threshold[7]);

	if (ret < 8)
		return -EINVAL;

	for (i = 0; i < 8; i++)
		if (user_twts_threshold[i] < 0)
			return -EINVAL;

	for (i = 0; i < 8; i++)
		twts_threshold[i]=user_twts_threshold[i];
            
	return count;
}

static ssize_t show_load_threshold(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%u %u %u %u %u %u %u %u\n", load_threshold[0], load_threshold[1], load_threshold[2], load_threshold[3], 
	    load_threshold[4], load_threshold[5], load_threshold[6], load_threshold[7]);

	return out - buf;
}

static ssize_t store_load_threshold(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	int i;
    unsigned int user_load_threshold[8] = {0, 0, 0, 0, 0, 0, 0, 0};

	ret = sscanf(buf, "%u %u %u %u %u %u %u %u", &user_load_threshold[0], &user_load_threshold[1], &user_load_threshold[2] , &user_load_threshold[3],
	    &user_load_threshold[4], &user_load_threshold[5], &user_load_threshold[6], &user_load_threshold[7]);

	if (ret < 8)
		return -EINVAL;

	for (i = 0; i < 8; i++)
		if (user_load_threshold[i] < 0 || user_load_threshold[i] > 100)
			return -EINVAL;

	for (i = 0; i < 8; i++)
		load_threshold[i]=user_load_threshold[i];
            
	return count;
}

static ssize_t show_log_hotplugging(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", log_hotplugging);

	return out - buf;
}

static ssize_t store_log_hotplugging(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;
		
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 0 || n > 1)
		return -EINVAL;

	log_hotplugging = n;	
	return count;
}

CPQ_BASIC_ATTRIBUTE(sample_rate, 0644, uint);
CPQ_BASIC_ATTRIBUTE(input_boost_enabled, 0644, uint);
CPQ_BASIC_ATTRIBUTE(input_boost_cpus, 0644, uint);
CPQ_BASIC_ATTRIBUTE(input_boost_duration, 0644, uint);
CPQ_ATTRIBUTE_CUSTOM(twts_threshold, 0644, show_twts_threshold, store_twts_threshold);
CPQ_ATTRIBUTE_CUSTOM(load_threshold, 0644, show_load_threshold, store_load_threshold);
CPQ_ATTRIBUTE_CUSTOM(log_hotplugging, 0644, show_log_hotplugging, store_log_hotplugging);
CPQ_BASIC_ATTRIBUTE(rq_depth_threshold, 0644, uint);
CPQ_BASIC_ATTRIBUTE(rq_depth_load_threshold, 0644, uint);
CPQ_BASIC_ATTRIBUTE(rq_depth_cpus_threshold, 0644, uint);

static struct attribute *load_stats_attributes[] = {
	&sample_rate_attr.attr,
	&input_boost_enabled_attr.attr,
	&input_boost_cpus_attr.attr,
	&input_boost_duration_attr.attr,
	&twts_threshold_attr.attr,
	&load_threshold_attr.attr,
	&log_hotplugging_attr.attr,
	&rq_depth_threshold_attr.attr,
	&rq_depth_load_threshold_attr.attr,
	&rq_depth_cpus_threshold_attr.attr,
	NULL,
};

static const struct sysfs_ops load_stats_sysfs_ops = {
	.show = cpuquiet_auto_sysfs_show,
	.store = cpuquiet_auto_sysfs_store,
};

static struct kobj_type ktype_runnables = {
	.sysfs_ops = &load_stats_sysfs_ops,
	.default_attrs = load_stats_attributes,
};

static int load_stats_sysfs(void)
{
	int err;

	load_stats_kobject = kzalloc(sizeof(*load_stats_kobject),
				GFP_KERNEL);

	if (!load_stats_kobject)
		return -ENOMEM;

	err = cpuquiet_kobject_init(load_stats_kobject, &ktype_runnables,
				"load_stats");

	if (err)
		kfree(load_stats_kobject);

	return err;
}

static void load_stats_device_busy(void)
{
	hotplug_info("%s\n", __func__);
	if (load_stats_state != DISABLED) {
		load_stats_state = DISABLED;
		cancel_delayed_work_sync(&load_stats_work);
	}
}

static void load_stats_device_free(void)
{
	hotplug_info("%s\n", __func__);
	if (load_stats_state == DISABLED) {
		first_call = true;
		total_time = 0;
		last_time = 0;	
		load_stats_state = IDLE;
		load_stats_work_func(NULL);
	}
}

static void load_stats_touch_event(void)
{	
	if (load_stats_state == DISABLED)
		return;

	if (!cpq_is_suspended() && input_boost_enabled && !input_boost_running){
		if (input_boost_task_alive)
			wake_up_process(input_boost_task);
	}
}

static void load_stats_stop(void)
{
	load_stats_state = DISABLED;
	cancel_delayed_work_sync(&load_stats_work);
	
	if (input_boost_task_alive)
		kthread_stop(input_boost_task);

	input_boost_task_alive = false;
	destroy_workqueue(load_stats_wq);
	kobject_put(load_stats_kobject);
}

static int load_stats_start(void)
{
	int err;
	struct sched_param param = { .sched_priority = MAX_RT_PRIO-1 };
	
	err = load_stats_sysfs();
	if (err)
		return err;

	load_stats_wq = alloc_workqueue("cpuquiet-load_stats", WQ_HIGHPRI, 0);
	if (!load_stats_wq)
		return -ENOMEM;

	INIT_DELAYED_WORK(&load_stats_work, load_stats_work_func);

	input_boost_task = kthread_create (
			load_stats_boost_task,
					NULL,
					"cpuquiet_input_boost_task"
			);

	if (IS_ERR(input_boost_task))
		pr_err("%s: failed to create input boost task\n", __func__);
	else {
		sched_setscheduler_nocheck(input_boost_task, SCHED_FIFO, &param);
		get_task_struct(input_boost_task);
		input_boost_task_alive = true;
		hotplug_info("%s: input boost task created\n", __func__);
	}

	first_call = true;
	total_time = 0;
	last_time = 0;	
	load_stats_state = IDLE;
	load_stats_work_func(NULL);

	return 0;
}

struct cpuquiet_governor load_stats_governor = {
	.name		   	  = "load_stats",
	.start			  = load_stats_start,
	.device_free_notification = load_stats_device_free,
	.device_busy_notification = load_stats_device_busy,
	.stop			  = load_stats_stop,
	.touch_event_notification = load_stats_touch_event,
	.owner		   	  = THIS_MODULE,
};

static int __init init_load_stats(void)
{
	return cpuquiet_register_governor(&load_stats_governor);
}

static void __exit exit_load_stats(void)
{
	cpuquiet_unregister_governor(&load_stats_governor);
}

MODULE_LICENSE("GPL");
module_init(init_load_stats);
module_exit(exit_load_stats);
