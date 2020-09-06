/*
 * Driver for generic Bluetooth SCO link
 * Copyright 2011 Lars-Peter Clausen <lars@metafoo.de>
 *
 *  This program is free software; you can redistribute  it and/or modify it
 *  under  the terms of  the GNU General  Public License as published by the
 *  Free Software Foundation;  either version 2 of the  License, or (at your
 *  option) any later version.
 *
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/platform_device.h>

#include <sound/soc.h>

static struct snd_soc_dai_driver bt_sco_dai = {
	.name = "bt-sco-pcm",
	.playback = {
		.channels_min = 1,
		.channels_max = 1,
		.rates = SNDRV_PCM_RATE_8000,
		.formats = SNDRV_PCM_FMTBIT_S16_LE,
	},
	.capture = {
		.channels_min = 1,
		.channels_max = 1,
		.rates = SNDRV_PCM_RATE_8000,
		.formats = SNDRV_PCM_FMTBIT_S16_LE,
	},
};

static struct snd_soc_codec_driver soc_codec_dev_bt_sco;

<<<<<<< HEAD:sound/soc/codecs/dfbmcs320.c
static int __devinit dfbmcs320_probe(struct platform_device *pdev)
=======
static int bt_sco_probe(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/bt-sco.c
{
	return snd_soc_register_codec(&pdev->dev, &soc_codec_dev_bt_sco,
			&bt_sco_dai, 1);
}

<<<<<<< HEAD:sound/soc/codecs/dfbmcs320.c
static int __devexit dfbmcs320_remove(struct platform_device *pdev)
=======
static int bt_sco_remove(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/bt-sco.c
{
	snd_soc_unregister_codec(&pdev->dev);

	return 0;
}

static struct platform_device_id bt_sco_driver_ids[] = {
	{
		.name		= "dfbmcs320",
	},
	{},
};
MODULE_DEVICE_TABLE(platform, bt_sco_driver_ids);

static struct platform_driver bt_sco_driver = {
	.driver = {
		.name = "bt-sco",
		.owner = THIS_MODULE,
	},
<<<<<<< HEAD:sound/soc/codecs/dfbmcs320.c
	.probe = dfbmcs320_probe,
	.remove = __devexit_p(dfbmcs320_remove),
=======
	.probe = bt_sco_probe,
	.remove = bt_sco_remove,
	.id_table = bt_sco_driver_ids,
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/bt-sco.c
};

module_platform_driver(bt_sco_driver);

MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
MODULE_DESCRIPTION("ASoC generic bluethooth sco link driver");
MODULE_LICENSE("GPL");
