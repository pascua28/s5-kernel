#ifndef _UAPI_LINUX_ASHMEM_H
#define _UAPI_LINUX_ASHMEM_H

#include <linux/limits.h>
#include <linux/ioctl.h>
#include <linux/compat.h>

#include "uapi/ashmem.h"

/* support of 32bit userspace on 64bit platforms */
#ifdef CONFIG_COMPAT
#define COMPAT_ASHMEM_SET_SIZE		_IOW(__ASHMEMIOC, 3, compat_size_t)
#define COMPAT_ASHMEM_SET_PROT_MASK	_IOW(__ASHMEMIOC, 5, unsigned int)
#endif

#endif /* _UAPI_LINUX_ASHMEM_H */
