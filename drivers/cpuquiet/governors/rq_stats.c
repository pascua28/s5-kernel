/*
 * Copyright (C) 2013 maxwen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * Author: maxwen
 *
 * rq_stats based cpuquiet governor
 * based on tegra_mpdecision.c
 * Copyright (c) 2012, Dennis Rassmann <showp1984@gmail.com>
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

// from cpuquiet.c
extern unsigned int cpq_max_cpus(void);
extern unsigned int cpq_min_cpus(void);
extern bool cpq_is_suspended(void);

typedef enum {
	DISABLED,
	IDLE,
	DOWN,
	UP,
} RQ_STATS_STATE;

static struct delayed_work rq_stats_work;
static struct kobject *rq_stats_kobject;

/* configurable parameters */
static unsigned int sample_rate = 70;		/* msec */
static unsigned int start_delay = 20000;
static RQ_STATS_STATE rq_stats_state;
static struct workqueue_struct *rq_stats_wq;

static unsigned int nwns_threshold[8] = {20, 14, 26, 16, 30, 18, 0, 20};
static unsigned int twts_threshold[8] = {140, 0, 140, 190, 140, 190, 0, 190};

extern unsigned int get_rq_info(void);

static u64 input_boost_end_time = 0;
static bool input_boost_running = false;
static unsigned int input_boost_duration = 3 * 70; /* ms */
static unsigned int input_boost_cpus = 2;
static unsigned int input_boost_enabled = true;
static bool input_boost_task_alive = false;
static struct task_struct *input_boost_task;

static bool first_call = true;
static u64 total_time;
static u64 last_time;
DEFINE_MUTEX(rq_stats_work_lock);

static bool log_hotplugging = false;
#define hotplug_info(msg...) do { \
	if (log_hotplugging) pr_info("[RQ_STATS]: " msg); \
	} while (0)
	
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

static void update_rq_stats_state(void)
{
	unsigned int rq_depth;
	unsigned int nr_cpu_online;
	unsigned int max_cpus = cpq_max_cpus();
	unsigned int min_cpus = cpq_min_cpus();
	u64 current_time;
	u64 this_time = 0;
	int index;
		
	if (rq_stats_state == DISABLED)
		return;

	current_time = ktime_to_ms(ktime_get());
	if (current_time <= start_delay){
		rq_stats_state = IDLE;
		return;
	}

	if (first_call) {
		first_call = false;
	} else {
		this_time = current_time - last_time;
	}
	total_time += this_time;
	rq_depth = get_rq_info();
	nr_cpu_online = num_online_cpus();
	rq_stats_state = IDLE;

	if (nr_cpu_online) {
		index = (nr_cpu_online - 1) * 2;
		if ((nr_cpu_online < CONFIG_NR_CPUS) && (rq_depth >= nwns_threshold[index])) {
			if (total_time >= twts_threshold[index]) {
            	if (nr_cpu_online < max_cpus){
            		hotplug_info("UP rq_depth=%d total_time=%lld nwns_threshold[index]=%d twts_threshold[index]=%d nr_cpu_online=%d min_cpus=%d max_cpus=%d\n", rq_depth, total_time, nwns_threshold[index], twts_threshold[index], nr_cpu_online, min_cpus, max_cpus);
                	rq_stats_state = UP;
                }
			}
		} else if (rq_depth <= nwns_threshold[index+1]) {
			if (total_time >= twts_threshold[index+1] ) {
            	if ((nr_cpu_online > 1) && (nr_cpu_online > min_cpus)){
            		hotplug_info("DOWN rq_depth=%d total_time=%lld nwns_threshold[index+1]=%d twts_threshold[index+1]=%d nr_cpu_online=%d min_cpus=%d max_cpus=%d\n", rq_depth, total_time, nwns_threshold[index+1], twts_threshold[index+1], nr_cpu_online, min_cpus, max_cpus);
                   	rq_stats_state = DOWN;
                }
			}
		} else {
			rq_stats_state = IDLE;
			total_time = 0;
		}
	} else {
		total_time = 0;
	}

	if (input_boost_running && current_time > input_boost_end_time)
		input_boost_running = false;

	if (input_boost_running){
		if (rq_stats_state != UP){
			rq_stats_state = IDLE;
			hotplug_info("IDLE because of input boost\n");
		}
	}

	if (rq_stats_state != IDLE)
		total_time = 0;

	last_time = ktime_to_ms(ktime_get());
}

static bool __rq_stats_work_func(void)
{
	bool up = false;
	bool sample = false;
	unsigned int cpu = nr_cpu_ids;

	switch (rq_stats_state) {
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
			__func__, rq_stats_state);
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

static void rq_stats_work_func(struct work_struct *work)
{
	bool sample = false;

	mutex_lock(&rq_stats_work_lock);

	update_rq_stats_state();

	sample = __rq_stats_work_func();

	if (sample)
		queue_delayed_work(rq_stats_wq, &rq_stats_work,
				msecs_to_jiffies(sample_rate));

	mutex_unlock(&rq_stats_work_lock);
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

		mutex_lock(&rq_stats_work_lock);
		
		input_boost_running = true;
			
		/* do boost work */
		nr_cpu_online = num_online_cpus();
		if (nr_cpu_online < input_boost_cpus){
			max_cpus = cpq_max_cpus();
			for (i = nr_cpu_online; i < input_boost_cpus; i++){
				if (i < max_cpus){
					rq_stats_state = UP;
					hotplug_info("UP because of input boost\n");
					__rq_stats_work_func();
				}
			}
		}
		input_boost_end_time = ktime_to_ms(ktime_get()) + input_boost_duration;
			
		mutex_unlock(&rq_stats_work_lock);
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

static ssize_t show_nwns_threshold(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%u %u %u %u %u %u %u %u\n", nwns_threshold[0], nwns_threshold[1], nwns_threshold[2], nwns_threshold[3], 
	    nwns_threshold[4], nwns_threshold[5], nwns_threshold[6], nwns_threshold[7]);

	return out - buf;
}

static ssize_t store_nwns_threshold(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	int i;
    unsigned int user_nwns_threshold[8] = {0, 0, 0, 0, 0, 0, 0, 0};

	ret = sscanf(buf, "%u %u %u %u %u %u %u %u", &user_nwns_threshold[0], &user_nwns_threshold[1], &user_nwns_threshold[2] , &user_nwns_threshold[3],
	    &user_nwns_threshold[4], &user_nwns_threshold[5], &user_nwns_threshold[6], &user_nwns_threshold[7]);

	if (ret < 8)
		return -EINVAL;

	for (i = 0; i < 8; i++)
		if (user_nwns_threshold[i] < 0)
			return -EINVAL;

	for (i = 0; i < 8; i++)
		nwns_threshold[i]=user_nwns_threshold[i];
            
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
CPQ_ATTRIBUTE_CUSTOM(nwns_threshold, 0644, show_nwns_threshold, store_nwns_threshold);
CPQ_ATTRIBUTE_CUSTOM(log_hotplugging, 0644, show_log_hotplugging, store_log_hotplugging);

static struct attribute *rq_stats_attributes[] = {
	&sample_rate_attr.attr,
	&input_boost_enabled_attr.attr,
	&input_boost_cpus_attr.attr,
	&input_boost_duration_attr.attr,
	&twts_threshold_attr.attr,
	&nwns_threshold_attr.attr,
	&log_hotplugging_attr.attr,
	NULL,
};

static const struct sysfs_ops rq_stats_sysfs_ops = {
	.show = cpuquiet_auto_sysfs_show,
	.store = cpuquiet_auto_sysfs_store,
};

static struct kobj_type ktype_runnables = {
	.sysfs_ops = &rq_stats_sysfs_ops,
	.default_attrs = rq_stats_attributes,
};

static int rq_stats_sysfs(void)
{
	int err;

	rq_stats_kobject = kzalloc(sizeof(*rq_stats_kobject),
				GFP_KERNEL);

	if (!rq_stats_kobject)
		return -ENOMEM;

	err = cpuquiet_kobject_init(rq_stats_kobject, &ktype_runnables,
				"rq_stats");

	if (err)
		kfree(rq_stats_kobject);

	return err;
}

static void rq_stats_device_busy(void)
{
	hotplug_info("%s\n", __func__);
	if (rq_stats_state != DISABLED) {
		rq_stats_state = DISABLED;
		cancel_delayed_work_sync(&rq_stats_work);
	}
}

static void rq_stats_device_free(void)
{
	hotplug_info("%s\n", __func__);
	if (rq_stats_state == DISABLED) {
		first_call = true;
		total_time = 0;
		last_time = 0;	
		rq_stats_state = IDLE;
		rq_stats_work_func(NULL);
	}
}

static void load_stats_touch_event(void)
{
	if (rq_stats_state == DISABLED)
		return;

	if (!cpq_is_suspended() && input_boost_enabled && !input_boost_running){
		if (input_boost_task_alive)
			wake_up_process(input_boost_task);	
	}
}

static void rq_stats_stop(void)
{
	rq_stats_state = DISABLED;
	cancel_delayed_work_sync(&rq_stats_work);
	
	if (input_boost_task_alive)
		kthread_stop(input_boost_task);

	input_boost_task_alive = false;
	destroy_workqueue(rq_stats_wq);
	kobject_put(rq_stats_kobject);
}

static int rq_stats_start(void)
{
	int err;
	struct sched_param param = { .sched_priority = MAX_RT_PRIO-1 };

	err = rq_stats_sysfs();
	if (err)
		return err;

	rq_stats_wq = alloc_workqueue("cpuquiet-rq_stats", WQ_HIGHPRI, 0);
	if (!rq_stats_wq)
		return -ENOMEM;

	INIT_DELAYED_WORK(&rq_stats_work, rq_stats_work_func);

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
	rq_stats_state = IDLE;
	rq_stats_work_func(NULL);

	return 0;
}

struct cpuquiet_governor rq_stats_governor = {
	.name		   	  = "rq_stats",
	.start			  = rq_stats_start,
	.device_free_notification = rq_stats_device_free,
	.device_busy_notification = rq_stats_device_busy,
	.stop			  = rq_stats_stop,
	.touch_event_notification = load_stats_touch_event,
	.owner		   	  = THIS_MODULE,
};

static int __init init_rq_stats(void)
{
	return cpuquiet_register_governor(&rq_stats_governor);
}

static void __exit exit_rq_stats(void)
{
	cpuquiet_unregister_governor(&rq_stats_governor);
}

MODULE_LICENSE("GPL");
module_init(init_rq_stats);
module_exit(exit_rq_stats);
