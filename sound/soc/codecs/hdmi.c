/*
 * ALSA SoC codec driver for HDMI audio codecs.
 * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
 * Author: Ricardo Neri <ricardo.neri@ti.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA
 *
 */
#include <linux/module.h>
#include <sound/soc.h>

#define DRV_NAME "hdmi-audio-codec"

static struct snd_soc_codec_driver hdmi_codec;

static struct snd_soc_dai_driver hdmi_codec_dai = {
	.name = "hdmi-hifi",
	.playback = {
		.channels_min = 2,
		.channels_max = 8,
		.rates = SNDRV_PCM_RATE_32000 |
			SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
			SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
			SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
		.formats = SNDRV_PCM_FMTBIT_S16_LE |
			SNDRV_PCM_FMTBIT_S24_LE,
	},
};

<<<<<<< HEAD:sound/soc/codecs/omap-hdmi.c
static __devinit int omap_hdmi_codec_probe(struct platform_device *pdev)
=======
static int hdmi_codec_probe(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/hdmi.c
{
	return snd_soc_register_codec(&pdev->dev, &hdmi_codec,
			&hdmi_codec_dai, 1);
}

<<<<<<< HEAD:sound/soc/codecs/omap-hdmi.c
static __devexit int omap_hdmi_codec_remove(struct platform_device *pdev)
=======
static int hdmi_codec_remove(struct platform_device *pdev)
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/hdmi.c
{
	snd_soc_unregister_codec(&pdev->dev);
	return 0;
}

static struct platform_driver hdmi_codec_driver = {
	.driver		= {
		.name	= DRV_NAME,
		.owner	= THIS_MODULE,
	},

<<<<<<< HEAD:sound/soc/codecs/omap-hdmi.c
	.probe		= omap_hdmi_codec_probe,
	.remove		= __devexit_p(omap_hdmi_codec_remove),
=======
	.probe		= hdmi_codec_probe,
	.remove		= hdmi_codec_remove,
>>>>>>> bedaca4e311e2c2abe0a215ee2b25c133e435211:sound/soc/codecs/hdmi.c
};

module_platform_driver(hdmi_codec_driver);

MODULE_AUTHOR("Ricardo Neri <ricardo.neri@ti.com>");
MODULE_DESCRIPTION("ASoC generic HDMI codec driver");
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:" DRV_NAME);
