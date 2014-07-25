/*
 * Input mediator with simple 2-step priority ordering
 *
 * Copyright (c) 2013 maxwen
 */

/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published by
 * the Free Software Foundation.
 */


#include <linux/init.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/device.h>
#include <linux/input.h>

static LIST_HEAD(input_handler_list_primary);
static LIST_HEAD(input_handler_list_secondary);

void input_register_mediator_primary(struct input_mediator_handler* handler)
{
	list_add_tail(&handler->node, &input_handler_list_primary);
}

void input_unregister_mediator_primary(struct input_mediator_handler* handler)
{
	list_del_init(&handler->node);
}

void input_register_mediator_secondary(struct input_mediator_handler* handler)
{
	list_add_tail(&handler->node, &input_handler_list_secondary);
}

void input_unregister_mediator_secondary(struct input_mediator_handler* handler)
{
	list_del_init(&handler->node);
}

static void mediator_input_event(struct input_handle *handle, unsigned int type,
	unsigned int code, int value) {
	struct input_mediator_handler *handler;

	list_for_each_entry(handler, &input_handler_list_primary, node)
		handler->event(handle, type, code, value);

	list_for_each_entry(handler, &input_handler_list_secondary, node)
		handler->event(handle, type, code, value);
}

static int mediator_input_connect(struct input_handler *handler,
		struct input_dev *dev, const struct input_device_id *id) {
	struct input_handle *handle;
	int error;

	pr_info("%s input connect to %s\n", __func__, dev->name);

	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
	if (!handle)
		return -ENOMEM;

	handle->dev = dev;
	handle->handler = handler;
	handle->name = "input_mediator";

	error = input_register_handle(handle);
	if (error)
		goto err2;

	error = input_open_device(handle);
	if (error)
		goto err1;

	return 0;
	err1: input_unregister_handle(handle);
	err2: kfree(handle);
	pr_err("%s faild to connect input handler %d\n", __func__, error);
	return error;
}

static void mediator_input_disconnect(struct input_handle *handle) {
	input_close_device(handle);
	input_unregister_handle(handle);
	kfree(handle);
}

static const struct input_device_id mediator_ids[] = {
{
		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
			 INPUT_DEVICE_ID_MATCH_ABSBIT,
		.evbit = { BIT_MASK(EV_ABS) },
		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
			    BIT_MASK(ABS_MT_POSITION_X) |
			    BIT_MASK(ABS_MT_POSITION_Y) },
	}, /* multi-touch touchscreen */
	{
		.flags = INPUT_DEVICE_ID_MATCH_KEYBIT |
			 INPUT_DEVICE_ID_MATCH_ABSBIT,
		.keybit = { [BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH) },
		.absbit = { [BIT_WORD(ABS_X)] =
			    BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) },
	}, /* touchpad */
	{ },
};

static struct input_handler mediator_input_handler = {
	.event = mediator_input_event,
	.connect = mediator_input_connect,
	.disconnect = mediator_input_disconnect,
	.name = "input_mediator",
	.id_table = mediator_ids,
	};

static int mediator_input_init(void)
{
	return input_register_handler(&mediator_input_handler);
}

late_initcall(mediator_input_init);
