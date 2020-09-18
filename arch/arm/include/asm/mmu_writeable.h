/*
 * Copyright (c) 2011, The Linux Foundation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
#ifndef _MMU_WRITEABLE_H
#define _MMU_WRITEABLE_H

static inline void mem_text_writeable_spinlock(unsigned long *flags) {};
static inline void mem_text_address_writeable(unsigned long addr) {};
static inline void mem_text_address_restore(void) {};
static inline void mem_text_writeable_spinunlock(unsigned long *flags) {};

void mem_text_write_kernel_word(unsigned long *addr, unsigned long word);

#endif
