/*
 * drivers/cpuquiet/cpuquiet_driver.c
 *
 * Generic cpuquiet driver
 *
 * Copyright (c) 2012 NVIDIA CORPORATION.  All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/slab.h>
#include <linux/cpu.h>
#include <linux/cpuquiet.h>
#include <linux/earlysuspend.h>
#include <linux/rq_stats.h>

static struct work_struct minmax_work;
static struct work_struct cpu_core_state_work;
static struct kobject *auto_sysfs_kobject;

static bool enabled = false;
static bool manual_hotplug = false;
// core 0 is always active
unsigned int cpu_core_state[3] = {0, 0, 0};
		
static unsigned int min_cpus = 1;
static unsigned int max_cpus = CONFIG_NR_CPUS;

#define DEFAULT_SCREEN_OFF_CPU_CAP 2
static unsigned int screen_off_max_cpus = DEFAULT_SCREEN_OFF_CPU_CAP;
static bool screen_off_cap = false;
#ifdef CONFIG_HAS_EARLYSUSPEND
struct early_suspend cpuquiet_early_suspender;
#endif
static bool screen_off_cap_active = false;
static bool is_suspended = false;

static bool log_hotplugging = false;
#define hotplug_info(msg...) do { \
	if (log_hotplugging) pr_info("[CPUQUIET]: " msg); \
	} while (0)

static inline unsigned int num_cpu_check(unsigned int num)
{
	if (num > CONFIG_NR_CPUS)
		return CONFIG_NR_CPUS;
	if (num < 1)
		return 1;
	return num;
}

bool cpq_is_suspended(void)
{
    return is_suspended;
}

unsigned inline int cpq_max_cpus(void)
{
    if (screen_off_cap && screen_off_cap_active)
	    return min(num_cpu_check(max_cpus), num_cpu_check(screen_off_max_cpus));
	return num_cpu_check(max_cpus);
}

unsigned inline int cpq_min_cpus(void)
{
	return num_cpu_check(min_cpus);
}

static inline void show_status(const char* extra)
{
	hotplug_info("%s Mask=[%d%d%d%d]\n",
    	extra, cpu_online(0), cpu_online(1), cpu_online(2), cpu_online(3));
}

static int __cpuinit update_core_config(unsigned int cpunumber, bool up)
{
	int ret = -EINVAL;
	unsigned int nr_cpus = num_online_cpus();
	int max_cpus = cpq_max_cpus();
	int min_cpus = cpq_min_cpus();
				
	if (cpunumber >= nr_cpu_ids)
		return ret;
			
	if (up) {
		if (nr_cpus < max_cpus){
			show_status("UP");
			ret = cpu_up(cpunumber);
		}
	} else {
		if (nr_cpus > 1 && nr_cpus > min_cpus){
			show_status("DOWN");
			ret = cpu_down(cpunumber);
		}
	}
			
	return ret;
}

static int __cpuinit quiesence_cpu(unsigned int cpunumber)
{
	return update_core_config(cpunumber, false);
}

static int __cpuinit wake_cpu(unsigned int cpunumber)
{
	return update_core_config(cpunumber, true);
}

static struct cpuquiet_driver cpuquiet_driver = {
	.name                   = "cpuquiet_driver",
	.quiesence_cpu          = quiesence_cpu,
	.wake_cpu               = wake_cpu,
};

static void __cpuinit min_max_constraints_workfunc(struct work_struct *work)
{
	int count = -1;
	bool up = false;
	unsigned int cpu;

	int nr_cpus = num_online_cpus();
	int max_cpus = cpq_max_cpus();
	int min_cpus = cpq_min_cpus();
	
	if (nr_cpus < min_cpus) {
		up = true;
		count = min_cpus - nr_cpus;
	} else if (nr_cpus > max_cpus && max_cpus >= min_cpus) {
		count = nr_cpus - max_cpus;
	}

	for (;count > 0; count--) {
		if (up) {
			cpu = cpumask_next_zero(0, cpu_online_mask);
			if (cpu < nr_cpu_ids){
				show_status("UP");
				cpu_up(cpu);
			}
			else
				break;
		} else {
			cpu = cpumask_next(0, cpu_online_mask);
			if (cpu < nr_cpu_ids){
				show_status("DOWN");
				cpu_down(cpu);
			}
			else
				break;
		}
	}
}

static void min_cpus_change(void)
{	
	schedule_work(&minmax_work);
}

static void max_cpus_change(void)
{	
	if (cpq_max_cpus() < num_online_cpus())
		schedule_work(&minmax_work);
}

static ssize_t show_min_cpus(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", min_cpus);

	return out - buf;
}

static ssize_t store_min_cpus(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;

	if (!enabled)
		return -EBUSY;
	
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 1 || n > CONFIG_NR_CPUS)
		return -EINVAL;

	if (manual_hotplug)
		return -EBUSY;
	
	min_cpus = n;
	min_cpus_change();

	pr_info(CPUQUIET_TAG "min_cpus=%d\n", min_cpus);				
	return count;
}

static ssize_t show_max_cpus(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", max_cpus);

	return out - buf;
}

static ssize_t store_max_cpus(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;

	if (!enabled)
		return -EBUSY;
	
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 1 || n > CONFIG_NR_CPUS)
		return -EINVAL;

	if (manual_hotplug)
		return -EBUSY;

	max_cpus = n;	
	max_cpus_change();

	pr_info(CPUQUIET_TAG "max_cpus=%d\n", max_cpus);			
	return count;
}

static void set_manual_hotplug(unsigned int mode)
{
	if (!enabled)
		return;

	if (manual_hotplug == mode)
		return;
     
	manual_hotplug = mode;	

	pr_info(CPUQUIET_TAG "manual_hotplug=%d\n", manual_hotplug);
		
	// stop governor
	if (manual_hotplug) {
		cpuquiet_device_busy();
		schedule_work(&cpu_core_state_work);
	} else {
		cpuquiet_device_free();
	}	    
}

static ssize_t show_manual_hotplug(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", manual_hotplug);

	return out - buf;
}

static ssize_t store_manual_hotplug(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;

	if (!enabled)
		return -EBUSY;
		
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 0 || n > 1)
		return -EINVAL;

	set_manual_hotplug(n);
	return count;
}

static void __cpuinit cpu_core_state_workfunc(struct work_struct *work)
{
	int i = 0;
	int cpu = 0;

	for (i = 0; i < 3; i++){
		cpu = i + 1;
		if (cpu_core_state[i] == 0 && cpu_online(cpu)){
			show_status("DOWN");
			cpu_down(cpu);
		} else if (cpu_core_state[i] == 1 && !cpu_online(cpu)){
			show_status("UP");
			cpu_up(cpu);
		}
	}
}

static void set_cpu_core_state(unsigned int new_cpu_core_state_user[3], bool force)
{
	cpu_core_state[0]=new_cpu_core_state_user[0];
	cpu_core_state[1]=new_cpu_core_state_user[1];
	cpu_core_state[2]=new_cpu_core_state_user[2];

	if (manual_hotplug || force)
		schedule_work(&cpu_core_state_work);

	pr_info(CPUQUIET_TAG "cpu_core_state=%u %u %u\n", cpu_core_state[0], cpu_core_state[1], cpu_core_state[2]);
}

static ssize_t show_cpu_core_state(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%u %u %u\n", cpu_core_state[0], cpu_core_state[1], cpu_core_state[2]);

	return out - buf;
}

static ssize_t store_cpu_core_state(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int cpu_core_state_user[3] = {0, 0, 0};
	int i = 0;

	if (!enabled)
		return -EBUSY;

	ret = sscanf(buf, "%u %u %u", &cpu_core_state_user[0], &cpu_core_state_user[1],
		&cpu_core_state_user[2]);

	if (ret < 3)
		return -EINVAL;

	for (i = 0; i < 3; i++){
		if (cpu_core_state_user[i] < 0 || cpu_core_state_user[i] > 1)
			return -EINVAL;
	}

	set_cpu_core_state(cpu_core_state_user, false);
		    
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

static ssize_t show_screen_off_cap(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", screen_off_cap);

	return out - buf;
}

static ssize_t store_screen_off_cap(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;
		
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 0 || n > 1)
		return -EINVAL;

	screen_off_cap = n;	
	return count;
}

static ssize_t show_screen_off_max_cpus(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", screen_off_max_cpus);

	return out - buf;
}

static ssize_t store_screen_off_max_cpus(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;
		
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 1 || n > CONFIG_NR_CPUS)
		return -EINVAL;

	screen_off_max_cpus = n;	
	return count;
}

static ssize_t show_enabled(struct cpuquiet_attribute *cattr, char *buf)
{
	char *out = buf;
		
	out += sprintf(out, "%d\n", enabled);

	return out - buf;
}

static ssize_t store_enabled(struct cpuquiet_attribute *cattr,
					const char *buf, size_t count)
{
	int ret;
	unsigned int n;
	unsigned int cpu_core_state_user[3] = {0, 0, 0};
		    		
	ret = sscanf(buf, "%d", &n);

	if ((ret != 1) || n < 0 || n > 1)
		return -EINVAL;

	if (n != enabled) {
		enabled = n;
		if (!enabled) {
			// stop governor
			cpuquiet_device_busy();

			// down all cpus
			set_cpu_core_state(cpu_core_state_user, true);

			// enable load calc for mpdecision
			enable_rq_load_calc(true);
		} else {
			// disable mpdecision load calc - just burning cpu cycles
			enable_rq_load_calc(false);
			// start governor
			cpuquiet_device_free();
		}
	}

	return count;
}

CPQ_ATTRIBUTE_CUSTOM(enabled, 0644, show_enabled, store_enabled);
CPQ_ATTRIBUTE_CUSTOM(min_cpus, 0644, show_min_cpus, store_min_cpus);
CPQ_ATTRIBUTE_CUSTOM(max_cpus, 0644, show_max_cpus, store_max_cpus);
CPQ_ATTRIBUTE_CUSTOM(manual_hotplug, 0644, show_manual_hotplug, store_manual_hotplug);
CPQ_ATTRIBUTE_CUSTOM(cpu_core_state, 0644, show_cpu_core_state, store_cpu_core_state);
CPQ_ATTRIBUTE_CUSTOM(log_hotplugging, 0644, show_log_hotplugging, store_log_hotplugging);
CPQ_ATTRIBUTE_CUSTOM(screen_off_cap, 0644, show_screen_off_cap, store_screen_off_cap);
CPQ_ATTRIBUTE_CUSTOM(screen_off_max_cpus, 0644, show_screen_off_max_cpus, store_screen_off_max_cpus);

static struct attribute *cpq_auto_attributes[] = {
	&enabled_attr.attr,
	&min_cpus_attr.attr,
	&max_cpus_attr.attr,
	&manual_hotplug_attr.attr,
	&cpu_core_state_attr.attr,
	&log_hotplugging_attr.attr,
	&screen_off_cap_attr.attr,
	&screen_off_max_cpus_attr.attr,
	NULL,
};

static const struct sysfs_ops cpq_auto_sysfs_ops = {
	.show = cpuquiet_auto_sysfs_show,
	.store = cpuquiet_auto_sysfs_store,
};

static struct kobj_type ktype_sysfs = {
	.sysfs_ops = &cpq_auto_sysfs_ops,
	.default_attrs = cpq_auto_attributes,
};

static int cpq_auto_sysfs(void)
{
	int err;

	auto_sysfs_kobject = kzalloc(sizeof(*auto_sysfs_kobject),
					GFP_KERNEL);

	if (!auto_sysfs_kobject)
		return -ENOMEM;

	err = cpuquiet_kobject_init(auto_sysfs_kobject, &ktype_sysfs,
				"cpuquiet_driver");

	if (err)
		kfree(auto_sysfs_kobject);

	return err;
}

#ifdef CONFIG_HAS_EARLYSUSPEND
static void cpuquiet_early_suspend(struct early_suspend *h)
{
	is_suspended = true;
	if (screen_off_cap){
		pr_info(CPUQUIET_TAG "%s: limit to %d cores\n", __func__, screen_off_max_cpus);
		screen_off_cap_active = true;
		max_cpus_change();
	}
}

static void cpuquiet_late_resume(struct early_suspend *h)
{
	is_suspended = false;	
	if (screen_off_cap){
		pr_info(CPUQUIET_TAG "%s: release limit to %d cores\n", __func__, screen_off_max_cpus);
		screen_off_cap_active = false;
		max_cpus_change();
	}
}
#endif

int __init cpq_auto_hotplug_init(void)
{
	int err;
	
	INIT_WORK(&minmax_work, min_max_constraints_workfunc);
	INIT_WORK(&cpu_core_state_work, cpu_core_state_workfunc);

	pr_info(CPUQUIET_TAG "%s: initialized\n", __func__);

	err = cpuquiet_register_driver(&cpuquiet_driver);
	if (err) {
		return err;
	}

	err = cpq_auto_sysfs();
	if (err)
		goto error;

#ifdef CONFIG_HAS_EARLYSUSPEND
	// will cap core num on screen off
	cpuquiet_early_suspender.suspend = cpuquiet_early_suspend;
	cpuquiet_early_suspender.resume = cpuquiet_late_resume;
	cpuquiet_early_suspender.level = EARLY_SUSPEND_LEVEL_DISABLE_FB + 100;
	register_early_suspend(&cpuquiet_early_suspender);
#endif
	
	enabled = true;
	// disable mpdecision load calc - just burning cpu cycles
	enable_rq_load_calc(false);

	return err;
	
error:
	cpuquiet_unregister_driver(&cpuquiet_driver);

	return err;
}

void __init cpq_auto_hotplug_exit(void)
{
#ifdef CONFIG_HAS_EARLYSUSPEND
	unregister_early_suspend(&cpuquiet_early_suspender);
#endif
	cpuquiet_unregister_driver(&cpuquiet_driver);
	kobject_put(auto_sysfs_kobject);
}
