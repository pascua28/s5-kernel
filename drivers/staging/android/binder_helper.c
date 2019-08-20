/* binder_helper.c
**
** Android runtime helper for selecting either 32-bit or 64-bit binder
**
** Copyright (C) 2019
**
** Samuel Pascua <pascua.samuel.14@gmail.com>
**
** This software is licensed under the terms of the GNU General Public
** License version 2, as published by the Free Software Foundation, and
** may be copied, distributed, and modified under those terms.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
*/
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>
#include <linux/proc_fs.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("S. G. Pascua");

extern int binder_init(void);
extern int binder32_init(void);

static int binder_helper_init(void)
{
	struct file *f;
	f = filp_open("/nougat", O_RDONLY, 0);
	if (IS_ERR(f)) {
		binder_init();
	} else {
		binder32_init();
		filp_close(f, NULL);
	}
	return 0;
}

device_initcall(binder_helper_init);
