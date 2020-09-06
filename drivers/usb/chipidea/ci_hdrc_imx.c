/*
 * Copyright 2012 Freescale Semiconductor, Inc.
 * Copyright (C) 2012 Marek Vasut <marex@denx.de>
 * on behalf of DENX Software Engineering GmbH
 *
 * The code contained herein is licensed under the GNU General Public
 * License. You may obtain a copy of the GNU General Public License
 * Version 2 or later at the following locations:
 *
 * http://www.opensource.org/licenses/gpl-license.html
 * http://www.gnu.org/copyleft/gpl.html
 */

#include <linux/module.h>
#include <linux/of_platform.h>
#include <linux/of_gpio.h>
#include <linux/platform_device.h>
#include <linux/pm_runtime.h>
#include <linux/dma-mapping.h>
#include <linux/usb/chipidea.h>
#include <linux/clk.h>
#include <linux/regulator/consumer.h>

#include "ci.h"
<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
=======
#include "ci_hdrc_imx.h"
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c

#define pdev_to_phy(pdev) \
	((struct usb_phy *)platform_get_drvdata(pdev))

struct ci_hdrc_imx_data {
	struct usb_phy *phy;
	struct platform_device *ci_pdev;
	struct clk *clk;
	struct regulator *reg_vbus;
};

<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
static struct ci13xxx_platform_data ci13xxx_imx_platdata __devinitdata  = {
	.name			= "ci13xxx_imx",
	.flags			= CI13XXX_REQUIRE_TRANSCEIVER |
				  CI13XXX_PULLUP_ON_VBUS |
				  CI13XXX_DISABLE_STREAMING,
	.capoffset		= DEF_CAPOFFSET,
};

static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
=======
static const struct usbmisc_ops *usbmisc_ops;

/* Common functions shared by usbmisc drivers */

int usbmisc_set_ops(const struct usbmisc_ops *ops)
{
	if (usbmisc_ops)
		return -EBUSY;

	usbmisc_ops = ops;

	return 0;
}
EXPORT_SYMBOL_GPL(usbmisc_set_ops);

void usbmisc_unset_ops(const struct usbmisc_ops *ops)
{
	usbmisc_ops = NULL;
}
EXPORT_SYMBOL_GPL(usbmisc_unset_ops);

int usbmisc_get_init_data(struct device *dev, struct usbmisc_usb_device *usbdev)
{
	struct device_node *np = dev->of_node;
	struct of_phandle_args args;
	int ret;

	usbdev->dev = dev;

	ret = of_parse_phandle_with_args(np, "fsl,usbmisc", "#index-cells",
					0, &args);
	if (ret) {
		dev_err(dev, "Failed to parse property fsl,usbmisc, errno %d\n",
			ret);
		memset(usbdev, 0, sizeof(*usbdev));
		return ret;
	}
	usbdev->index = args.args[0];
	of_node_put(args.np);

	if (of_find_property(np, "disable-over-current", NULL))
		usbdev->disable_oc = 1;

	if (of_find_property(np, "external-vbus-divider", NULL))
		usbdev->evdo = 1;

	return 0;
}
EXPORT_SYMBOL_GPL(usbmisc_get_init_data);

/* End of common functions shared by usbmisc drivers*/

static int ci_hdrc_imx_probe(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
{
	struct ci_hdrc_imx_data *data;
	struct ci_hdrc_platform_data pdata = {
		.name		= "ci_hdrc_imx",
		.capoffset	= DEF_CAPOFFSET,
		.flags		= CI_HDRC_REQUIRE_TRANSCEIVER |
				  CI_HDRC_PULLUP_ON_VBUS |
				  CI_HDRC_DISABLE_STREAMING,
	};
	struct resource *res;
<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
	struct regulator *reg_vbus;
=======
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
	int ret;

	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
	if (!data) {
		dev_err(&pdev->dev, "Failed to allocate ci_hdrc-imx data!\n");
		return -ENOMEM;
	}

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!res) {
		dev_err(&pdev->dev, "Can't get device resources!\n");
		return -ENOENT;
	}

	data->clk = devm_clk_get(&pdev->dev, NULL);
	if (IS_ERR(data->clk)) {
		dev_err(&pdev->dev,
			"Failed to get clock, err=%ld\n", PTR_ERR(data->clk));
		return PTR_ERR(data->clk);
	}

	ret = clk_prepare_enable(data->clk);
	if (ret) {
		dev_err(&pdev->dev,
			"Failed to prepare or enable clock, err=%d\n", ret);
		return ret;
	}

	data->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "fsl,usbphy", 0);
	if (!IS_ERR(data->phy)) {
		ret = usb_phy_init(data->phy);
		if (ret) {
			dev_err(&pdev->dev, "unable to init phy: %d\n", ret);
			goto err_clk;
		}
	} else if (PTR_ERR(data->phy) == -EPROBE_DEFER) {
		ret = -EPROBE_DEFER;
		goto err_clk;
	}

	/* we only support host now, so enable vbus here */
	data->reg_vbus = devm_regulator_get(&pdev->dev, "vbus");
	if (!IS_ERR(data->reg_vbus)) {
		ret = regulator_enable(data->reg_vbus);
		if (ret) {
			dev_err(&pdev->dev,
				"Failed to enable vbus regulator, err=%d\n",
				ret);
			goto err_clk;
		}
	} else {
		data->reg_vbus = NULL;
	}

	pdata.phy = data->phy;

	if (!pdev->dev.dma_mask) {
		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
		if (!pdev->dev.dma_mask) {
			ret = -ENOMEM;
			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
			goto err;
		}
		*pdev->dev.dma_mask = DMA_BIT_MASK(32);
		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
	}
<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
	plat_ci = ci13xxx_add_device(&pdev->dev,
=======

	data->ci_pdev = ci_hdrc_add_device(&pdev->dev,
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
				pdev->resource, pdev->num_resources,
				&pdata);
	if (IS_ERR(data->ci_pdev)) {
		ret = PTR_ERR(data->ci_pdev);
		dev_err(&pdev->dev,
			"Can't register ci_hdrc platform device, err=%d\n",
			ret);
		goto err;
	}

<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
	data->ci_pdev = plat_ci;
=======
	if (usbmisc_ops && usbmisc_ops->post) {
		ret = usbmisc_ops->post(&pdev->dev);
		if (ret) {
			dev_err(&pdev->dev,
				"usbmisc post failed, ret=%d\n", ret);
			goto disable_device;
		}
	}

>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
	platform_set_drvdata(pdev, data);

	pm_runtime_no_callbacks(&pdev->dev);
	pm_runtime_enable(&pdev->dev);

	return 0;

disable_device:
	ci_hdrc_remove_device(data->ci_pdev);
err:
	if (data->reg_vbus)
		regulator_disable(data->reg_vbus);
err_clk:
	clk_disable_unprepare(data->clk);
	return ret;
}

<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
static int __devexit ci13xxx_imx_remove(struct platform_device *pdev)
=======
static int ci_hdrc_imx_remove(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
{
	struct ci_hdrc_imx_data *data = platform_get_drvdata(pdev);

	pm_runtime_disable(&pdev->dev);
	ci_hdrc_remove_device(data->ci_pdev);

	if (data->reg_vbus)
		regulator_disable(data->reg_vbus);

	if (data->phy) {
		usb_phy_shutdown(data->phy);
		module_put(data->phy->dev->driver->owner);
	}

	clk_disable_unprepare(data->clk);

	return 0;
}

static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
	{ .compatible = "fsl,imx27-usb", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);

<<<<<<< HEAD:drivers/usb/chipidea/ci13xxx_imx.c
static struct platform_driver ci13xxx_imx_driver = {
	.probe = ci13xxx_imx_probe,
	.remove = __devexit_p(ci13xxx_imx_remove),
=======
static struct platform_driver ci_hdrc_imx_driver = {
	.probe = ci_hdrc_imx_probe,
	.remove = ci_hdrc_imx_remove,
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:drivers/usb/chipidea/ci_hdrc_imx.c
	.driver = {
		.name = "imx_usb",
		.owner = THIS_MODULE,
		.of_match_table = ci_hdrc_imx_dt_ids,
	 },
};

module_platform_driver(ci_hdrc_imx_driver);

MODULE_ALIAS("platform:imx-usb");
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("CI HDRC i.MX USB binding");
MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
MODULE_AUTHOR("Richard Zhao <richard.zhao@freescale.com>");
