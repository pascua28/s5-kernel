#ifndef __ASMARM_ARCH_TIMER_H
#define __ASMARM_ARCH_TIMER_H

#include <linux/ioport.h>
#include <linux/clocksource.h>
#include <asm/errno.h>

struct arch_timer {
	struct resource	res[3];
};

#ifdef CONFIG_ARM_ARCH_TIMER
int arch_timer_register(struct arch_timer *);
#include <asm/errno.h>

#define ARCH_HAS_READ_CURRENT_TIMER
int arch_timer_of_register(void);
u64 arch_counter_get_cntpct(void);
#else
static inline int arch_timer_register(struct arch_timer *at)
{
	return -ENXIO;
}

static inline int arch_timer_of_register(void)
{
	return -ENXIO;
}

static inline cycle_t arch_counter_get_cntpct(void)
{
	return 0;
}
#endif

#endif
