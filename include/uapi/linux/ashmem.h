#ifndef _UAPI_LINUX_ASHMEM_H
#define _UAPI_LINUX_ASHMEM_H

#include <linux/limits.h>
#include <linux/ioctl.h>
#include <linux/compat.h>

#include "uapi/ashmem.h"
#define ASHMEM_UNPIN		_IOW(__ASHMEMIOC, 8, struct ashmem_pin)
#define ASHMEM_GET_PIN_STATUS	_IO(__ASHMEMIOC, 9)
#define ASHMEM_PURGE_ALL_CACHES	_IO(__ASHMEMIOC, 10)
#define ASHMEM_CACHE_FLUSH_RANGE	_IO(__ASHMEMIOC, 11)
#define ASHMEM_CACHE_CLEAN_RANGE	_IO(__ASHMEMIOC, 12)
#define ASHMEM_CACHE_INV_RANGE		_IO(__ASHMEMIOC, 13)

/* support of 32bit userspace on 64bit platforms */
#ifdef CONFIG_COMPAT
#define COMPAT_ASHMEM_SET_SIZE		_IOW(__ASHMEMIOC, 3, compat_size_t)
#define COMPAT_ASHMEM_SET_PROT_MASK	_IOW(__ASHMEMIOC, 5, unsigned int)
#endif

#endif /* _UAPI_LINUX_ASHMEM_H */
