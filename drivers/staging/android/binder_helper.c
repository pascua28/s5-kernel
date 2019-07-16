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
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <asm/uaccess.h>
#define BUFSIZE 4
static char proc_data[BUFSIZE];

MODULE_LICENSE("GPL");
MODULE_AUTHOR("S. G. Pascua");

static struct proc_dir_entry *ent;
extern int binder_init(void);
extern int binder32_init(void);

static ssize_t binder32_read(struct file *file, char *ubuf,size_t count, loff_t *ppos)
{
	if (count > BUFSIZE)
		count = BUFSIZE;

	if(copy_to_user(ubuf,proc_data,count))
		return -EFAULT;

	return count;
}

static ssize_t binder32_write(struct file *file, const char *buf, size_t count, loff_t *data)
{

	if(count > BUFSIZE)
	    return -EFAULT;

	if(copy_from_user(proc_data, buf, count))
	    return -EFAULT;

	if(!strncmp("1",(char*)proc_data,1))
		binder32_init();
	else
		binder_init();

	return count;
}

static struct file_operations binder32_ops = 
{
	.owner = THIS_MODULE,
	.write = binder32_write,
	.read  = binder32_read,
};
 
static int binder_helper_init(void)
{
	ent=proc_create("android_n",0660,NULL,&binder32_ops);
	return 0;
}

fs_initcall(binder_helper_init);
