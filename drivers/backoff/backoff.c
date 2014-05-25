#include <linux/module.h>
#include <linux/suspend.h>
#include <linux/time.h>
#include <linux/wakelock.h>

static struct wake_lock suspend_backoff_lock;

#define SUSPEND_BACKOFF_THRESHOLD 10
#define SUSPEND_BACKOFF_INTERVAL 10000
static int backoff_pm_notify(struct notifier_block *b, unsigned long event, void *p)
{
        static struct timespec ts_entry, ts_exit;
	static unsigned suspend_short_count = 0;
	switch (event) {
	case PM_SUSPEND_PREPARE:
	        getnstimeofday(&ts_entry);
		break;
	case PM_POST_SUSPEND:
	        getnstimeofday(&ts_exit);
		if (ts_exit.tv_sec - ts_entry.tv_sec <= 1) {
			++suspend_short_count;
			if (suspend_short_count == SUSPEND_BACKOFF_THRESHOLD) {
				printk("%s: Backing off.\n",__func__);
				wake_lock_timeout(&suspend_backoff_lock,
					msecs_to_jiffies(SUSPEND_BACKOFF_INTERVAL));
				suspend_short_count = 0;
			}
		}
		else {
			suspend_short_count = 0;
		}
		break;
	}
	return NOTIFY_DONE;
}

static struct notifier_block backoff_pm_notifier = {
	.notifier_call = backoff_pm_notify,
};

static int __init suspend_backoff_init(void)
{
	wake_lock_init(&suspend_backoff_lock, WAKE_LOCK_SUSPEND,
		       "suspend_backoff");
	return register_pm_notifier(&backoff_pm_notifier);
}
device_initcall(suspend_backoff_init);

static void __exit suspend_backoff_exit(void)
{
	unregister_pm_notifier(&backoff_pm_notifier);
	wake_lock_destroy(&suspend_backoff_lock);
}
module_exit(suspend_backoff_exit);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("Wakelock if too much suspend spam");
