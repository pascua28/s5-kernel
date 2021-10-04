/*
 * zsmalloc memory allocator
 *
 * Copyright (C) 2011  Nitin Gupta
 * Copyright (C) 2012, 2013 Minchan Kim
 *
 * This code is released using a dual license strategy: BSD/GPL
 * You can choose the license that better fits your requirements.
 *
 * Released under the terms of 3-clause BSD License
 * Released under the terms of GNU General Public License Version 2.0
 */

#ifndef _ZS_MALLOC_H_
#define _ZS_MALLOC_H_

#include <linux/types.h>

/*
 * zsmalloc mapping modes
 *
 * NOTE: These only make a difference when a mapped object spans pages
 */
enum zs_mapmode {
	ZS_MM_RW, /* normal read-write mapping */
	ZS_MM_RO, /* read-only (no copy-out at unmap time) */
	ZS_MM_WO /* write-only (no copy-in at map time) */
};

struct zs_ops {
	struct page * (*alloc)(gfp_t);
	void (*free)(struct page *);
};

struct zs_pool;

#ifdef CONFIG_ZRAM
struct zs_pool *zs_create_pool(gfp_t flags);
#else
struct zs_pool *zs_create_pool(gfp_t flags, struct zs_ops *ops);
#endif /* CONFIG_ZRAM */
void zs_destroy_pool(struct zs_pool *pool);

#ifdef CONFIG_ZRAM
unsigned long zs_malloc(struct zs_pool *pool, size_t size);
#else
unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t flags);
#endif /* CONFIG_ZRAM */
void zs_free(struct zs_pool *pool, unsigned long obj);

void *zs_map_object(struct zs_pool *pool, unsigned long handle,
			enum zs_mapmode mm);
void zs_unmap_object(struct zs_pool *pool, unsigned long handle);

u64 zs_get_total_size_bytes(struct zs_pool *pool);

#endif
