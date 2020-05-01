/*
 * AD7792/AD7793 SPI ADC driver
 *
 * Copyright 2011 Analog Devices Inc.
 *
 * Licensed under the GPL-2.
 */

#include <linux/interrupt.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/sysfs.h>
#include <linux/spi/spi.h>
#include <linux/regulator/consumer.h>
#include <linux/err.h>
#include <linux/sched.h>
#include <linux/delay.h>
#include <linux/module.h>

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
#include "../iio.h"
#include "../sysfs.h"
#include "../buffer.h"
#include "../ring_sw.h"
#include "../trigger.h"
#include "../trigger_consumer.h"

#include "ad7793.h"
=======
#include <linux/iio/iio.h>
#include <linux/iio/sysfs.h>
#include <linux/iio/buffer.h>
#include <linux/iio/trigger.h>
#include <linux/iio/trigger_consumer.h>
#include <linux/iio/triggered_buffer.h>
#include <linux/iio/adc/ad_sigma_delta.h>
#include <linux/platform_data/ad7793.h>

/* Registers */
#define AD7793_REG_COMM		0 /* Communications Register (WO, 8-bit) */
#define AD7793_REG_STAT		0 /* Status Register	     (RO, 8-bit) */
#define AD7793_REG_MODE		1 /* Mode Register	     (RW, 16-bit */
#define AD7793_REG_CONF		2 /* Configuration Register  (RW, 16-bit) */
#define AD7793_REG_DATA		3 /* Data Register	     (RO, 16-/24-bit) */
#define AD7793_REG_ID		4 /* ID Register	     (RO, 8-bit) */
#define AD7793_REG_IO		5 /* IO Register	     (RO, 8-bit) */
#define AD7793_REG_OFFSET	6 /* Offset Register	     (RW, 16-bit
				   * (AD7792)/24-bit (AD7793)) */
#define AD7793_REG_FULLSALE	7 /* Full-Scale Register
				   * (RW, 16-bit (AD7792)/24-bit (AD7793)) */

/* Communications Register Bit Designations (AD7793_REG_COMM) */
#define AD7793_COMM_WEN		(1 << 7) /* Write Enable */
#define AD7793_COMM_WRITE	(0 << 6) /* Write Operation */
#define AD7793_COMM_READ	(1 << 6) /* Read Operation */
#define AD7793_COMM_ADDR(x)	(((x) & 0x7) << 3) /* Register Address */
#define AD7793_COMM_CREAD	(1 << 2) /* Continuous Read of Data Register */

/* Status Register Bit Designations (AD7793_REG_STAT) */
#define AD7793_STAT_RDY		(1 << 7) /* Ready */
#define AD7793_STAT_ERR		(1 << 6) /* Error (Overrange, Underrange) */
#define AD7793_STAT_CH3		(1 << 2) /* Channel 3 */
#define AD7793_STAT_CH2		(1 << 1) /* Channel 2 */
#define AD7793_STAT_CH1		(1 << 0) /* Channel 1 */

/* Mode Register Bit Designations (AD7793_REG_MODE) */
#define AD7793_MODE_SEL(x)	(((x) & 0x7) << 13) /* Operation Mode Select */
#define AD7793_MODE_SEL_MASK	(0x7 << 13) /* Operation Mode Select mask */
#define AD7793_MODE_CLKSRC(x)	(((x) & 0x3) << 6) /* ADC Clock Source Select */
#define AD7793_MODE_RATE(x)	((x) & 0xF) /* Filter Update Rate Select */

#define AD7793_MODE_CONT		0 /* Continuous Conversion Mode */
#define AD7793_MODE_SINGLE		1 /* Single Conversion Mode */
#define AD7793_MODE_IDLE		2 /* Idle Mode */
#define AD7793_MODE_PWRDN		3 /* Power-Down Mode */
#define AD7793_MODE_CAL_INT_ZERO	4 /* Internal Zero-Scale Calibration */
#define AD7793_MODE_CAL_INT_FULL	5 /* Internal Full-Scale Calibration */
#define AD7793_MODE_CAL_SYS_ZERO	6 /* System Zero-Scale Calibration */
#define AD7793_MODE_CAL_SYS_FULL	7 /* System Full-Scale Calibration */

#define AD7793_CLK_INT		0 /* Internal 64 kHz Clock not
				   * available at the CLK pin */
#define AD7793_CLK_INT_CO	1 /* Internal 64 kHz Clock available
				   * at the CLK pin */
#define AD7793_CLK_EXT		2 /* External 64 kHz Clock */
#define AD7793_CLK_EXT_DIV2	3 /* External Clock divided by 2 */

/* Configuration Register Bit Designations (AD7793_REG_CONF) */
#define AD7793_CONF_VBIAS(x)	(((x) & 0x3) << 14) /* Bias Voltage
						     * Generator Enable */
#define AD7793_CONF_BO_EN	(1 << 13) /* Burnout Current Enable */
#define AD7793_CONF_UNIPOLAR	(1 << 12) /* Unipolar/Bipolar Enable */
#define AD7793_CONF_BOOST	(1 << 11) /* Boost Enable */
#define AD7793_CONF_GAIN(x)	(((x) & 0x7) << 8) /* Gain Select */
#define AD7793_CONF_REFSEL(x)	((x) << 6) /* INT/EXT Reference Select */
#define AD7793_CONF_BUF		(1 << 4) /* Buffered Mode Enable */
#define AD7793_CONF_CHAN(x)	((x) & 0xf) /* Channel select */
#define AD7793_CONF_CHAN_MASK	0xf /* Channel select mask */

#define AD7793_CH_AIN1P_AIN1M	0 /* AIN1(+) - AIN1(-) */
#define AD7793_CH_AIN2P_AIN2M	1 /* AIN2(+) - AIN2(-) */
#define AD7793_CH_AIN3P_AIN3M	2 /* AIN3(+) - AIN3(-) */
#define AD7793_CH_AIN1M_AIN1M	3 /* AIN1(-) - AIN1(-) */
#define AD7793_CH_TEMP		6 /* Temp Sensor */
#define AD7793_CH_AVDD_MONITOR	7 /* AVDD Monitor */

#define AD7795_CH_AIN4P_AIN4M	4 /* AIN4(+) - AIN4(-) */
#define AD7795_CH_AIN5P_AIN5M	5 /* AIN5(+) - AIN5(-) */
#define AD7795_CH_AIN6P_AIN6M	6 /* AIN6(+) - AIN6(-) */
#define AD7795_CH_AIN1M_AIN1M	8 /* AIN1(-) - AIN1(-) */

/* ID Register Bit Designations (AD7793_REG_ID) */
#define AD7785_ID		0xB
#define AD7792_ID		0xA
#define AD7793_ID		0xB
#define AD7794_ID		0xF
#define AD7795_ID		0xF
#define AD7796_ID		0xA
#define AD7797_ID		0xB
#define AD7798_ID		0x8
#define AD7799_ID		0x9
#define AD7793_ID_MASK		0xF

/* IO (Excitation Current Sources) Register Bit Designations (AD7793_REG_IO) */
#define AD7793_IO_IEXC1_IOUT1_IEXC2_IOUT2	0 /* IEXC1 connect to IOUT1,
						   * IEXC2 connect to IOUT2 */
#define AD7793_IO_IEXC1_IOUT2_IEXC2_IOUT1	1 /* IEXC1 connect to IOUT2,
						   * IEXC2 connect to IOUT1 */
#define AD7793_IO_IEXC1_IEXC2_IOUT1		2 /* Both current sources
						   * IEXC1,2 connect to IOUT1 */
#define AD7793_IO_IEXC1_IEXC2_IOUT2		3 /* Both current sources
						   * IEXC1,2 connect to IOUT2 */

#define AD7793_IO_IXCEN_10uA	(1 << 0) /* Excitation Current 10uA */
#define AD7793_IO_IXCEN_210uA	(2 << 0) /* Excitation Current 210uA */
#define AD7793_IO_IXCEN_1mA	(3 << 0) /* Excitation Current 1mA */
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

/* NOTE:
 * The AD7792/AD7793 features a dual use data out ready DOUT/RDY output.
 * In order to avoid contentions on the SPI bus, it's therefore necessary
 * to use spi bus locking.
 *
 * The DOUT/RDY output must also be wired to an interrupt capable GPIO.
 */

#define AD7793_FLAG_HAS_CLKSEL		BIT(0)
#define AD7793_FLAG_HAS_REFSEL		BIT(1)
#define AD7793_FLAG_HAS_VBIAS		BIT(2)
#define AD7793_HAS_EXITATION_CURRENT	BIT(3)
#define AD7793_FLAG_HAS_GAIN		BIT(4)
#define AD7793_FLAG_HAS_BUFFER		BIT(5)

struct ad7793_chip_info {
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	struct iio_chan_spec		channel[7];
=======
	unsigned int id;
	const struct iio_chan_spec *channels;
	unsigned int num_channels;
	unsigned int flags;

	const struct iio_info *iio_info;
	const u16 *sample_freq_avail;
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
};

struct ad7793_state {
	struct spi_device		*spi;
	struct iio_trigger		*trig;
	const struct ad7793_chip_info	*chip_info;
	struct regulator		*reg;
	struct ad7793_platform_data	*pdata;
	wait_queue_head_t		wq_data_avail;
	bool				done;
	bool				irq_dis;
	u16				int_vref_mv;
	u16				mode;
	u16				conf;
	u32				scale_avail[8][2];
	/* Note this uses fact that 8 the mask always fits in a long */
	unsigned long			available_scan_masks[7];
	/*
	 * DMA (thus cache coherency maintenance) requires the
	 * transfer buffers to live in their own cache lines.
	 */
	u8				data[4] ____cacheline_aligned;
};

enum ad7793_supported_device_ids {
	ID_AD7792,
	ID_AD7793,
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
=======
	ID_AD7794,
	ID_AD7795,
	ID_AD7796,
	ID_AD7797,
	ID_AD7798,
	ID_AD7799,
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
};

static int __ad7793_write_reg(struct ad7793_state *st, bool locked,
			      bool cs_change, unsigned char reg,
			      unsigned size, unsigned val)
{
	u8 *data = st->data;
	struct spi_transfer t = {
		.tx_buf		= data,
		.len		= size + 1,
		.cs_change	= cs_change,
	};
	struct spi_message m;

	data[0] = AD7793_COMM_WRITE | AD7793_COMM_ADDR(reg);

	switch (size) {
	case 3:
		data[1] = val >> 16;
		data[2] = val >> 8;
		data[3] = val;
		break;
	case 2:
		data[1] = val >> 8;
		data[2] = val;
		break;
	case 1:
		data[1] = val;
		break;
	default:
		return -EINVAL;
	}

	spi_message_init(&m);
	spi_message_add_tail(&t, &m);

	if (locked)
		return spi_sync_locked(st->spi, &m);
	else
		return spi_sync(st->spi, &m);
}

static int ad7793_write_reg(struct ad7793_state *st,
			    unsigned reg, unsigned size, unsigned val)
{
	return __ad7793_write_reg(st, false, false, reg, size, val);
}

static int __ad7793_read_reg(struct ad7793_state *st, bool locked,
			     bool cs_change, unsigned char reg,
			     int *val, unsigned size)
{
	u8 *data = st->data;
	int ret;
	struct spi_transfer t[] = {
		{
			.tx_buf = data,
			.len = 1,
		}, {
			.rx_buf = data,
			.len = size,
			.cs_change = cs_change,
		},
	};
	struct spi_message m;

	data[0] = AD7793_COMM_READ | AD7793_COMM_ADDR(reg);

	spi_message_init(&m);
	spi_message_add_tail(&t[0], &m);
	spi_message_add_tail(&t[1], &m);

	if (locked)
		ret = spi_sync_locked(st->spi, &m);
	else
		ret = spi_sync(st->spi, &m);

	if (ret < 0)
		return ret;

	switch (size) {
	case 3:
		*val = data[0] << 16 | data[1] << 8 | data[2];
		break;
	case 2:
		*val = data[0] << 8 | data[1];
		break;
	case 1:
		*val = data[0];
		break;
	default:
		return -EINVAL;
	}

	return 0;
}

static int ad7793_read_reg(struct ad7793_state *st,
			   unsigned reg, int *val, unsigned size)
{
	return __ad7793_read_reg(st, 0, 0, reg, val, size);
}

static int ad7793_read(struct ad7793_state *st, unsigned ch,
		       unsigned len, int *val)
{
	int ret;
	st->conf = (st->conf & ~AD7793_CONF_CHAN(-1)) | AD7793_CONF_CHAN(ch);
	st->mode = (st->mode & ~AD7793_MODE_SEL(-1)) |
		AD7793_MODE_SEL(AD7793_MODE_SINGLE);

	ad7793_write_reg(st, AD7793_REG_CONF, sizeof(st->conf), st->conf);

	spi_bus_lock(st->spi->master);
	st->done = false;

	ret = __ad7793_write_reg(st, 1, 1, AD7793_REG_MODE,
				 sizeof(st->mode), st->mode);
	if (ret < 0)
		goto out;

	st->irq_dis = false;
	enable_irq(st->spi->irq);
	wait_event_interruptible(st->wq_data_avail, st->done);

	ret = __ad7793_read_reg(st, 1, 0, AD7793_REG_DATA, val, len);
out:
	spi_bus_unlock(st->spi->master);

	return ret;
}

static int ad7793_calibrate(struct ad7793_state *st, unsigned mode, unsigned ch)
{
	int ret;

	st->conf = (st->conf & ~AD7793_CONF_CHAN(-1)) | AD7793_CONF_CHAN(ch);
	st->mode = (st->mode & ~AD7793_MODE_SEL(-1)) | AD7793_MODE_SEL(mode);

	ad7793_write_reg(st, AD7793_REG_CONF, sizeof(st->conf), st->conf);

	spi_bus_lock(st->spi->master);
	st->done = false;

	ret = __ad7793_write_reg(st, 1, 1, AD7793_REG_MODE,
				 sizeof(st->mode), st->mode);
	if (ret < 0)
		goto out;

	st->irq_dis = false;
	enable_irq(st->spi->irq);
	wait_event_interruptible(st->wq_data_avail, st->done);

	st->mode = (st->mode & ~AD7793_MODE_SEL(-1)) |
		AD7793_MODE_SEL(AD7793_MODE_IDLE);

	ret = __ad7793_write_reg(st, 1, 0, AD7793_REG_MODE,
				 sizeof(st->mode), st->mode);
out:
	spi_bus_unlock(st->spi->master);

	return ret;
}

static const u8 ad7793_calib_arr[6][2] = {
	{AD7793_MODE_CAL_INT_ZERO, AD7793_CH_AIN1P_AIN1M},
	{AD7793_MODE_CAL_INT_FULL, AD7793_CH_AIN1P_AIN1M},
	{AD7793_MODE_CAL_INT_ZERO, AD7793_CH_AIN2P_AIN2M},
	{AD7793_MODE_CAL_INT_FULL, AD7793_CH_AIN2P_AIN2M},
	{AD7793_MODE_CAL_INT_ZERO, AD7793_CH_AIN3P_AIN3M},
	{AD7793_MODE_CAL_INT_FULL, AD7793_CH_AIN3P_AIN3M}
};

static int ad7793_calibrate_all(struct ad7793_state *st)
{
	int i, ret;

	for (i = 0; i < ARRAY_SIZE(ad7793_calib_arr); i++) {
		ret = ad7793_calibrate(st, ad7793_calib_arr[i][0],
				       ad7793_calib_arr[i][1]);
		if (ret)
			goto out;
	}

	return 0;
out:
	dev_err(&st->spi->dev, "Calibration failed\n");
	return ret;
}

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
static int ad7793_setup(struct ad7793_state *st)
{
=======
static int ad7793_check_platform_data(struct ad7793_state *st,
	const struct ad7793_platform_data *pdata)
{
	if ((pdata->current_source_direction == AD7793_IEXEC1_IEXEC2_IOUT1 ||
		pdata->current_source_direction == AD7793_IEXEC1_IEXEC2_IOUT2) &&
		((pdata->exitation_current != AD7793_IX_10uA) &&
		(pdata->exitation_current != AD7793_IX_210uA)))
		return -EINVAL;

	if (!(st->chip_info->flags & AD7793_FLAG_HAS_CLKSEL) &&
		pdata->clock_src != AD7793_CLK_SRC_INT)
		return -EINVAL;

	if (!(st->chip_info->flags & AD7793_FLAG_HAS_REFSEL) &&
		pdata->refsel != AD7793_REFSEL_REFIN1)
		return -EINVAL;

	if (!(st->chip_info->flags & AD7793_FLAG_HAS_VBIAS) &&
		pdata->bias_voltage != AD7793_BIAS_VOLTAGE_DISABLED)
		return -EINVAL;

	if (!(st->chip_info->flags & AD7793_HAS_EXITATION_CURRENT) &&
		pdata->exitation_current != AD7793_IX_DISABLED)
		return -EINVAL;

	return 0;
}

static int ad7793_setup(struct iio_dev *indio_dev,
	const struct ad7793_platform_data *pdata,
	unsigned int vref_mv)
{
	struct ad7793_state *st = iio_priv(indio_dev);
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
	int i, ret = -1;
	unsigned long long scale_uv;
	u32 id;

	ret = ad7793_check_platform_data(st, pdata);
	if (ret)
		return ret;

	/* reset the serial interface */
	ret = spi_write(st->spi, (u8 *)&ret, sizeof(ret));
	if (ret < 0)
		goto out;
	usleep_range(500, 2000); /* Wait for at least 500us */

	/* write/read test for device presence */
	ret = ad7793_read_reg(st, AD7793_REG_ID, &id, 1);
	if (ret)
		goto out;

	id &= AD7793_ID_MASK;

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	if (!((id == AD7792_ID) || (id == AD7793_ID))) {
		dev_err(&st->spi->dev, "device ID query failed\n");
		goto out;
	}

	st->mode  = (st->pdata->mode & ~AD7793_MODE_SEL(-1)) |
			AD7793_MODE_SEL(AD7793_MODE_IDLE);
	st->conf  = st->pdata->conf & ~AD7793_CONF_CHAN(-1);
=======
	if (id != st->chip_info->id) {
		dev_err(&st->sd.spi->dev, "device ID query failed\n");
		goto out;
	}

	st->mode = AD7793_MODE_RATE(1);
	st->conf = 0;

	if (st->chip_info->flags & AD7793_FLAG_HAS_CLKSEL)
		st->mode |= AD7793_MODE_CLKSRC(pdata->clock_src);
	if (st->chip_info->flags & AD7793_FLAG_HAS_REFSEL)
		st->conf |= AD7793_CONF_REFSEL(pdata->refsel);
	if (st->chip_info->flags & AD7793_FLAG_HAS_VBIAS)
		st->conf |= AD7793_CONF_VBIAS(pdata->bias_voltage);
	if (pdata->buffered || !(st->chip_info->flags & AD7793_FLAG_HAS_BUFFER))
		st->conf |= AD7793_CONF_BUF;
	if (pdata->boost_enable &&
		(st->chip_info->flags & AD7793_FLAG_HAS_VBIAS))
		st->conf |= AD7793_CONF_BOOST;
	if (pdata->burnout_current)
		st->conf |= AD7793_CONF_BO_EN;
	if (pdata->unipolar)
		st->conf |= AD7793_CONF_UNIPOLAR;

	if (!(st->chip_info->flags & AD7793_FLAG_HAS_GAIN))
		st->conf |= AD7793_CONF_GAIN(7);
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

	ret = ad7793_write_reg(st, AD7793_REG_MODE, sizeof(st->mode), st->mode);
	if (ret)
		goto out;

	ret = ad7793_write_reg(st, AD7793_REG_CONF, sizeof(st->conf), st->conf);
	if (ret)
		goto out;

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	ret = ad7793_write_reg(st, AD7793_REG_IO,
			       sizeof(st->pdata->io), st->pdata->io);
	if (ret)
		goto out;
=======
	if (st->chip_info->flags & AD7793_HAS_EXITATION_CURRENT) {
		ret = ad_sd_write_reg(&st->sd, AD7793_REG_IO, 1,
				pdata->exitation_current |
				(pdata->current_source_direction << 2));
		if (ret)
			goto out;
	}
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

	ret = ad7793_calibrate_all(st);
	if (ret)
		goto out;

	/* Populate available ADC input ranges */
	for (i = 0; i < ARRAY_SIZE(st->scale_avail); i++) {
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
		scale_uv = ((u64)st->int_vref_mv * 100000000)
			>> (st->chip_info->channel[0].scan_type.realbits -
=======
		scale_uv = ((u64)vref_mv * 100000000)
			>> (st->chip_info->channels[0].scan_type.realbits -
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
			(!!(st->conf & AD7793_CONF_UNIPOLAR) ? 0 : 1));
		scale_uv >>= i;

		st->scale_avail[i][1] = do_div(scale_uv, 100000000) * 10;
		st->scale_avail[i][0] = scale_uv;
	}

	return 0;
out:
	dev_err(&st->spi->dev, "setup failed\n");
	return ret;
}

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
static int ad7793_ring_preenable(struct iio_dev *indio_dev)
{
	struct ad7793_state *st = iio_priv(indio_dev);
	struct iio_buffer *ring = indio_dev->buffer;
	size_t d_size;
	unsigned channel;

	if (bitmap_empty(indio_dev->active_scan_mask, indio_dev->masklength))
		return -EINVAL;

	channel = find_first_bit(indio_dev->active_scan_mask,
				 indio_dev->masklength);

	d_size = bitmap_weight(indio_dev->active_scan_mask,
			       indio_dev->masklength) *
		indio_dev->channels[0].scan_type.storagebits / 8;

	if (ring->scan_timestamp) {
		d_size += sizeof(s64);

		if (d_size % sizeof(s64))
			d_size += sizeof(s64) - (d_size % sizeof(s64));
	}

	if (indio_dev->buffer->access->set_bytes_per_datum)
		indio_dev->buffer->access->
			set_bytes_per_datum(indio_dev->buffer, d_size);

	st->mode  = (st->mode & ~AD7793_MODE_SEL(-1)) |
		    AD7793_MODE_SEL(AD7793_MODE_CONT);
	st->conf  = (st->conf & ~AD7793_CONF_CHAN(-1)) |
		    AD7793_CONF_CHAN(indio_dev->channels[channel].address);

	ad7793_write_reg(st, AD7793_REG_CONF, sizeof(st->conf), st->conf);

	spi_bus_lock(st->spi->master);
	__ad7793_write_reg(st, 1, 1, AD7793_REG_MODE,
			   sizeof(st->mode), st->mode);

	st->irq_dis = false;
	enable_irq(st->spi->irq);

	return 0;
}

static int ad7793_ring_postdisable(struct iio_dev *indio_dev)
{
	struct ad7793_state *st = iio_priv(indio_dev);

	st->mode  = (st->mode & ~AD7793_MODE_SEL(-1)) |
		    AD7793_MODE_SEL(AD7793_MODE_IDLE);

	st->done = false;
	wait_event_interruptible(st->wq_data_avail, st->done);

	if (!st->irq_dis)
		disable_irq_nosync(st->spi->irq);

	__ad7793_write_reg(st, 1, 0, AD7793_REG_MODE,
			   sizeof(st->mode), st->mode);

	return spi_bus_unlock(st->spi->master);
}

/**
 * ad7793_trigger_handler() bh of trigger launched polling to ring buffer
 **/

static irqreturn_t ad7793_trigger_handler(int irq, void *p)
{
	struct iio_poll_func *pf = p;
	struct iio_dev *indio_dev = pf->indio_dev;
	struct iio_buffer *ring = indio_dev->buffer;
	struct ad7793_state *st = iio_priv(indio_dev);
	s64 dat64[2];
	s32 *dat32 = (s32 *)dat64;

	if (!bitmap_empty(indio_dev->active_scan_mask, indio_dev->masklength))
		__ad7793_read_reg(st, 1, 1, AD7793_REG_DATA,
				  dat32,
				  indio_dev->channels[0].scan_type.realbits/8);

	/* Guaranteed to be aligned with 8 byte boundary */
	if (ring->scan_timestamp)
		dat64[1] = pf->timestamp;

	ring->access->store_to(ring, (u8 *)dat64, pf->timestamp);

	iio_trigger_notify_done(indio_dev->trig);
	st->irq_dis = false;
	enable_irq(st->spi->irq);

	return IRQ_HANDLED;
}

static const struct iio_buffer_setup_ops ad7793_ring_setup_ops = {
	.preenable = &ad7793_ring_preenable,
	.postenable = &iio_triggered_buffer_postenable,
	.predisable = &iio_triggered_buffer_predisable,
	.postdisable = &ad7793_ring_postdisable,
};

static int ad7793_register_ring_funcs_and_init(struct iio_dev *indio_dev)
{
	int ret;

	indio_dev->buffer = iio_sw_rb_allocate(indio_dev);
	if (!indio_dev->buffer) {
		ret = -ENOMEM;
		goto error_ret;
	}
	indio_dev->pollfunc = iio_alloc_pollfunc(&iio_pollfunc_store_time,
						 &ad7793_trigger_handler,
						 IRQF_ONESHOT,
						 indio_dev,
						 "ad7793_consumer%d",
						 indio_dev->id);
	if (indio_dev->pollfunc == NULL) {
		ret = -ENOMEM;
		goto error_deallocate_sw_rb;
	}

	/* Ring buffer functions - here trigger setup related */
	indio_dev->setup_ops = &ad7793_ring_setup_ops;

	/* Flag that polled ring buffering is possible */
	indio_dev->modes |= INDIO_BUFFER_TRIGGERED;
	return 0;

error_deallocate_sw_rb:
	iio_sw_rb_free(indio_dev->buffer);
error_ret:
	return ret;
}

static void ad7793_ring_cleanup(struct iio_dev *indio_dev)
{
	iio_dealloc_pollfunc(indio_dev->pollfunc);
	iio_sw_rb_free(indio_dev->buffer);
}

/**
 * ad7793_data_rdy_trig_poll() the event handler for the data rdy trig
 **/
static irqreturn_t ad7793_data_rdy_trig_poll(int irq, void *private)
{
	struct ad7793_state *st = iio_priv(private);

	st->done = true;
	wake_up_interruptible(&st->wq_data_avail);
	disable_irq_nosync(irq);
	st->irq_dis = true;
	iio_trigger_poll(st->trig, iio_get_time_ns());

	return IRQ_HANDLED;
}

static struct iio_trigger_ops ad7793_trigger_ops = {
	.owner = THIS_MODULE,
};

static int ad7793_probe_trigger(struct iio_dev *indio_dev)
{
	struct ad7793_state *st = iio_priv(indio_dev);
	int ret;

	st->trig = iio_allocate_trigger("%s-dev%d",
					spi_get_device_id(st->spi)->name,
					indio_dev->id);
	if (st->trig == NULL) {
		ret = -ENOMEM;
		goto error_ret;
	}
	st->trig->ops = &ad7793_trigger_ops;

	ret = request_irq(st->spi->irq,
			  ad7793_data_rdy_trig_poll,
			  IRQF_TRIGGER_LOW,
			  spi_get_device_id(st->spi)->name,
			  indio_dev);
	if (ret)
		goto error_free_trig;

	disable_irq_nosync(st->spi->irq);
	st->irq_dis = true;
	st->trig->dev.parent = &st->spi->dev;
	st->trig->private_data = indio_dev;

	ret = iio_trigger_register(st->trig);

	/* select default trigger */
	indio_dev->trig = st->trig;
	if (ret)
		goto error_free_irq;

	return 0;

error_free_irq:
	free_irq(st->spi->irq, indio_dev);
error_free_trig:
	iio_free_trigger(st->trig);
error_ret:
	return ret;
}

static void ad7793_remove_trigger(struct iio_dev *indio_dev)
{
	struct ad7793_state *st = iio_priv(indio_dev);

	iio_trigger_unregister(st->trig);
	free_irq(st->spi->irq, indio_dev);
	iio_free_trigger(st->trig);
}

static const u16 sample_freq_avail[16] = {0, 470, 242, 123, 62, 50, 39, 33, 19,
					  17, 16, 12, 10, 8, 6, 4};
=======
static const u16 ad7793_sample_freq_avail[16] = {0, 470, 242, 123, 62, 50, 39,
					33, 19, 17, 16, 12, 10, 8, 6, 4};

static const u16 ad7797_sample_freq_avail[16] = {0, 0, 0, 123, 62, 50, 0,
					33, 0, 17, 16, 12, 10, 8, 6, 4};
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

static ssize_t ad7793_read_frequency(struct device *dev,
		struct device_attribute *attr,
		char *buf)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7793_state *st = iio_priv(indio_dev);

	return sprintf(buf, "%d\n",
	       st->chip_info->sample_freq_avail[AD7793_MODE_RATE(st->mode)]);
}

static ssize_t ad7793_write_frequency(struct device *dev,
		struct device_attribute *attr,
		const char *buf,
		size_t len)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7793_state *st = iio_priv(indio_dev);
	long lval;
	int i, ret;

	mutex_lock(&indio_dev->mlock);
	if (iio_buffer_enabled(indio_dev)) {
		mutex_unlock(&indio_dev->mlock);
		return -EBUSY;
	}
	mutex_unlock(&indio_dev->mlock);

	ret = kstrtol(buf, 10, &lval);
	if (ret)
		return ret;

	if (lval == 0)
		return -EINVAL;

	ret = -EINVAL;

	for (i = 0; i < 16; i++)
		if (lval == st->chip_info->sample_freq_avail[i]) {
			mutex_lock(&indio_dev->mlock);
			st->mode &= ~AD7793_MODE_RATE(-1);
			st->mode |= AD7793_MODE_RATE(i);
			ad7793_write_reg(st, AD7793_REG_MODE,
					 sizeof(st->mode), st->mode);
			mutex_unlock(&indio_dev->mlock);
			ret = 0;
		}

	return ret ? ret : len;
}

static IIO_DEV_ATTR_SAMP_FREQ(S_IWUSR | S_IRUGO,
		ad7793_read_frequency,
		ad7793_write_frequency);

static IIO_CONST_ATTR_SAMP_FREQ_AVAIL(
	"470 242 123 62 50 39 33 19 17 16 12 10 8 6 4");

static IIO_CONST_ATTR_NAMED(sampling_frequency_available_ad7797,
	sampling_frequency_available, "123 62 50 33 17 16 12 10 8 6 4");

static ssize_t ad7793_show_scale_available(struct device *dev,
			struct device_attribute *attr, char *buf)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7793_state *st = iio_priv(indio_dev);
	int i, len = 0;

	for (i = 0; i < ARRAY_SIZE(st->scale_avail); i++)
		len += sprintf(buf + len, "%d.%09u ", st->scale_avail[i][0],
			       st->scale_avail[i][1]);

	len += sprintf(buf + len, "\n");

	return len;
}

static IIO_DEVICE_ATTR_NAMED(in_m_in_scale_available, in-in_scale_available,
			     S_IRUGO, ad7793_show_scale_available, NULL, 0);

static struct attribute *ad7793_attributes[] = {
	&iio_dev_attr_sampling_frequency.dev_attr.attr,
	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
	&iio_dev_attr_in_m_in_scale_available.dev_attr.attr,
	NULL
};

static const struct attribute_group ad7793_attribute_group = {
	.attrs = ad7793_attributes,
};

static struct attribute *ad7797_attributes[] = {
	&iio_dev_attr_sampling_frequency.dev_attr.attr,
	&iio_const_attr_sampling_frequency_available_ad7797.dev_attr.attr,
	NULL
};

static const struct attribute_group ad7797_attribute_group = {
	.attrs = ad7797_attributes,
};

static int ad7793_read_raw(struct iio_dev *indio_dev,
			   struct iio_chan_spec const *chan,
			   int *val,
			   int *val2,
			   long m)
{
	struct ad7793_state *st = iio_priv(indio_dev);
	int ret, smpl = 0;
	unsigned long long scale_uv;
	bool unipolar = !!(st->conf & AD7793_CONF_UNIPOLAR);

	switch (m) {
	case 0:
		mutex_lock(&indio_dev->mlock);
		if (iio_buffer_enabled(indio_dev))
			ret = -EBUSY;
		else
			ret = ad7793_read(st, chan->address,
					chan->scan_type.realbits / 8, &smpl);
		mutex_unlock(&indio_dev->mlock);

		if (ret < 0)
			return ret;

		*val = (smpl >> chan->scan_type.shift) &
			((1 << (chan->scan_type.realbits)) - 1);

		if (!unipolar)
			*val -= (1 << (chan->scan_type.realbits - 1));

		return IIO_VAL_INT;

	case IIO_CHAN_INFO_SCALE:
		switch (chan->type) {
		case IIO_VOLTAGE:
			if (chan->differential) {
				*val = st->
					scale_avail[(st->conf >> 8) & 0x7][0];
				*val2 = st->
					scale_avail[(st->conf >> 8) & 0x7][1];
				return IIO_VAL_INT_PLUS_NANO;
			} else {
				/* 1170mV / 2^23 * 6 */
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
				scale_uv = (1170ULL * 100000000ULL * 6ULL)
					>> (chan->scan_type.realbits -
					    (unipolar ? 0 : 1));
			}
			break;
		case IIO_TEMP:
			/* Always uses unity gain and internal ref */
			scale_uv = (2500ULL * 100000000ULL)
				>> (chan->scan_type.realbits -
				(unipolar ? 0 : 1));
=======
				scale_uv = (1170ULL * 1000000000ULL * 6ULL);
			}
			break;
		case IIO_TEMP:
				/* 1170mV / 0.81 mV/C / 2^23 */
				scale_uv = 1444444444444444ULL;
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
			break;
		default:
			return -EINVAL;
		}

		*val2 = do_div(scale_uv, 100000000) * 10;
		*val =  scale_uv;

		return IIO_VAL_INT_PLUS_NANO;
	}
	return -EINVAL;
}

static int ad7793_write_raw(struct iio_dev *indio_dev,
			       struct iio_chan_spec const *chan,
			       int val,
			       int val2,
			       long mask)
{
	struct ad7793_state *st = iio_priv(indio_dev);
	int ret, i;
	unsigned int tmp;

	mutex_lock(&indio_dev->mlock);
	if (iio_buffer_enabled(indio_dev)) {
		mutex_unlock(&indio_dev->mlock);
		return -EBUSY;
	}

	switch (mask) {
	case IIO_CHAN_INFO_SCALE:
		ret = -EINVAL;
		for (i = 0; i < ARRAY_SIZE(st->scale_avail); i++)
			if (val2 == st->scale_avail[i][1]) {
				tmp = st->conf;
				st->conf &= ~AD7793_CONF_GAIN(-1);
				st->conf |= AD7793_CONF_GAIN(i);

				if (tmp != st->conf) {
					ad7793_write_reg(st, AD7793_REG_CONF,
							 sizeof(st->conf),
							 st->conf);
					ad7793_calibrate_all(st);
				}
				ret = 0;
			}

	default:
		ret = -EINVAL;
	}

	mutex_unlock(&indio_dev->mlock);
	return ret;
}

static int ad7793_validate_trigger(struct iio_dev *indio_dev,
				   struct iio_trigger *trig)
{
	if (indio_dev->trig != trig)
		return -EINVAL;

	return 0;
}

static int ad7793_write_raw_get_fmt(struct iio_dev *indio_dev,
			       struct iio_chan_spec const *chan,
			       long mask)
{
	return IIO_VAL_INT_PLUS_NANO;
}

static const struct iio_info ad7793_info = {
	.read_raw = &ad7793_read_raw,
	.write_raw = &ad7793_write_raw,
	.write_raw_get_fmt = &ad7793_write_raw_get_fmt,
	.attrs = &ad7793_attribute_group,
	.validate_trigger = ad7793_validate_trigger,
	.driver_module = THIS_MODULE,
};

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
static const struct ad7793_chip_info ad7793_chip_info_tbl[] = {
	[ID_AD7793] = {
		.channel[0] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 0,
			.channel2 = 0,
			.address = AD7793_CH_AIN1P_AIN1M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 0,
			.scan_type = IIO_ST('s', 24, 32, 0)
		},
		.channel[1] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 1,
			.channel2 = 1,
			.address = AD7793_CH_AIN2P_AIN2M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 1,
			.scan_type = IIO_ST('s', 24, 32, 0)
		},
		.channel[2] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 2,
			.channel2 = 2,
			.address = AD7793_CH_AIN3P_AIN3M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 2,
			.scan_type = IIO_ST('s', 24, 32, 0)
		},
		.channel[3] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.extend_name = "shorted",
			.indexed = 1,
			.channel = 2,
			.channel2 = 2,
			.address = AD7793_CH_AIN1M_AIN1M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 2,
			.scan_type = IIO_ST('s', 24, 32, 0)
		},
		.channel[4] = {
			.type = IIO_TEMP,
			.indexed = 1,
			.channel = 0,
			.address = AD7793_CH_TEMP,
			.info_mask = IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
			.scan_index = 4,
			.scan_type = IIO_ST('s', 24, 32, 0),
		},
		.channel[5] = {
			.type = IIO_VOLTAGE,
			.extend_name = "supply",
			.indexed = 1,
			.channel = 4,
			.address = AD7793_CH_AVDD_MONITOR,
			.info_mask = IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
			.scan_index = 5,
			.scan_type = IIO_ST('s', 24, 32, 0),
		},
		.channel[6] = IIO_CHAN_SOFT_TIMESTAMP(6),
	},
	[ID_AD7792] = {
		.channel[0] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 0,
			.channel2 = 0,
			.address = AD7793_CH_AIN1P_AIN1M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 0,
			.scan_type = IIO_ST('s', 16, 32, 0)
		},
		.channel[1] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 1,
			.channel2 = 1,
			.address = AD7793_CH_AIN2P_AIN2M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 1,
			.scan_type = IIO_ST('s', 16, 32, 0)
		},
		.channel[2] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.indexed = 1,
			.channel = 2,
			.channel2 = 2,
			.address = AD7793_CH_AIN3P_AIN3M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 2,
			.scan_type = IIO_ST('s', 16, 32, 0)
		},
		.channel[3] = {
			.type = IIO_VOLTAGE,
			.differential = 1,
			.extend_name = "shorted",
			.indexed = 1,
			.channel = 2,
			.channel2 = 2,
			.address = AD7793_CH_AIN1M_AIN1M,
			.info_mask = IIO_CHAN_INFO_SCALE_SHARED_BIT,
			.scan_index = 2,
			.scan_type = IIO_ST('s', 16, 32, 0)
		},
		.channel[4] = {
			.type = IIO_TEMP,
			.indexed = 1,
			.channel = 0,
			.address = AD7793_CH_TEMP,
			.info_mask = IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
			.scan_index = 4,
			.scan_type = IIO_ST('s', 16, 32, 0),
		},
		.channel[5] = {
			.type = IIO_VOLTAGE,
			.extend_name = "supply",
			.indexed = 1,
			.channel = 4,
			.address = AD7793_CH_AVDD_MONITOR,
			.info_mask = IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
			.scan_index = 5,
			.scan_type = IIO_ST('s', 16, 32, 0),
		},
		.channel[6] = IIO_CHAN_SOFT_TIMESTAMP(6),
=======
static const struct iio_info ad7797_info = {
	.read_raw = &ad7793_read_raw,
	.write_raw = &ad7793_write_raw,
	.write_raw_get_fmt = &ad7793_write_raw_get_fmt,
	.attrs = &ad7793_attribute_group,
	.validate_trigger = ad_sd_validate_trigger,
	.driver_module = THIS_MODULE,
};

#define DECLARE_AD7793_CHANNELS(_name, _b, _sb, _s) \
const struct iio_chan_spec _name##_channels[] = { \
	AD_SD_DIFF_CHANNEL(0, 0, 0, AD7793_CH_AIN1P_AIN1M, (_b), (_sb), (_s)), \
	AD_SD_DIFF_CHANNEL(1, 1, 1, AD7793_CH_AIN2P_AIN2M, (_b), (_sb), (_s)), \
	AD_SD_DIFF_CHANNEL(2, 2, 2, AD7793_CH_AIN3P_AIN3M, (_b), (_sb), (_s)), \
	AD_SD_SHORTED_CHANNEL(3, 0, AD7793_CH_AIN1M_AIN1M, (_b), (_sb), (_s)), \
	AD_SD_TEMP_CHANNEL(4, AD7793_CH_TEMP, (_b), (_sb), (_s)), \
	AD_SD_SUPPLY_CHANNEL(5, 3, AD7793_CH_AVDD_MONITOR, (_b), (_sb), (_s)), \
	IIO_CHAN_SOFT_TIMESTAMP(6), \
}

#define DECLARE_AD7795_CHANNELS(_name, _b, _sb) \
const struct iio_chan_spec _name##_channels[] = { \
	AD_SD_DIFF_CHANNEL(0, 0, 0, AD7793_CH_AIN1P_AIN1M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(1, 1, 1, AD7793_CH_AIN2P_AIN2M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(2, 2, 2, AD7793_CH_AIN3P_AIN3M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(3, 3, 3, AD7795_CH_AIN4P_AIN4M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(4, 4, 4, AD7795_CH_AIN5P_AIN5M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(5, 5, 5, AD7795_CH_AIN6P_AIN6M, (_b), (_sb), 0), \
	AD_SD_SHORTED_CHANNEL(6, 0, AD7795_CH_AIN1M_AIN1M, (_b), (_sb), 0), \
	AD_SD_TEMP_CHANNEL(7, AD7793_CH_TEMP, (_b), (_sb), 0), \
	AD_SD_SUPPLY_CHANNEL(8, 3, AD7793_CH_AVDD_MONITOR, (_b), (_sb), 0), \
	IIO_CHAN_SOFT_TIMESTAMP(9), \
}

#define DECLARE_AD7797_CHANNELS(_name, _b, _sb) \
const struct iio_chan_spec _name##_channels[] = { \
	AD_SD_DIFF_CHANNEL(0, 0, 0, AD7793_CH_AIN1P_AIN1M, (_b), (_sb), 0), \
	AD_SD_SHORTED_CHANNEL(1, 0, AD7793_CH_AIN1M_AIN1M, (_b), (_sb), 0), \
	AD_SD_TEMP_CHANNEL(2, AD7793_CH_TEMP, (_b), (_sb), 0), \
	AD_SD_SUPPLY_CHANNEL(3, 3, AD7793_CH_AVDD_MONITOR, (_b), (_sb), 0), \
	IIO_CHAN_SOFT_TIMESTAMP(4), \
}

#define DECLARE_AD7799_CHANNELS(_name, _b, _sb) \
const struct iio_chan_spec _name##_channels[] = { \
	AD_SD_DIFF_CHANNEL(0, 0, 0, AD7793_CH_AIN1P_AIN1M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(1, 1, 1, AD7793_CH_AIN2P_AIN2M, (_b), (_sb), 0), \
	AD_SD_DIFF_CHANNEL(2, 2, 2, AD7793_CH_AIN3P_AIN3M, (_b), (_sb), 0), \
	AD_SD_SHORTED_CHANNEL(3, 0, AD7793_CH_AIN1M_AIN1M, (_b), (_sb), 0), \
	AD_SD_SUPPLY_CHANNEL(4, 3, AD7793_CH_AVDD_MONITOR, (_b), (_sb), 0), \
	IIO_CHAN_SOFT_TIMESTAMP(5), \
}

static DECLARE_AD7793_CHANNELS(ad7785, 20, 32, 4);
static DECLARE_AD7793_CHANNELS(ad7792, 16, 32, 0);
static DECLARE_AD7793_CHANNELS(ad7793, 24, 32, 0);
static DECLARE_AD7795_CHANNELS(ad7794, 16, 32);
static DECLARE_AD7795_CHANNELS(ad7795, 24, 32);
static DECLARE_AD7797_CHANNELS(ad7796, 16, 16);
static DECLARE_AD7797_CHANNELS(ad7797, 24, 32);
static DECLARE_AD7799_CHANNELS(ad7798, 16, 16);
static DECLARE_AD7799_CHANNELS(ad7799, 24, 32);

static const struct ad7793_chip_info ad7793_chip_info_tbl[] = {
	[ID_AD7785] = {
		.id = AD7785_ID,
		.channels = ad7785_channels,
		.num_channels = ARRAY_SIZE(ad7785_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL |
			AD7793_FLAG_HAS_REFSEL |
			AD7793_FLAG_HAS_VBIAS |
			AD7793_HAS_EXITATION_CURRENT |
			AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7792] = {
		.id = AD7792_ID,
		.channels = ad7792_channels,
		.num_channels = ARRAY_SIZE(ad7792_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL |
			AD7793_FLAG_HAS_REFSEL |
			AD7793_FLAG_HAS_VBIAS |
			AD7793_HAS_EXITATION_CURRENT |
			AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7793] = {
		.id = AD7793_ID,
		.channels = ad7793_channels,
		.num_channels = ARRAY_SIZE(ad7793_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL |
			AD7793_FLAG_HAS_REFSEL |
			AD7793_FLAG_HAS_VBIAS |
			AD7793_HAS_EXITATION_CURRENT |
			AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7794] = {
		.id = AD7794_ID,
		.channels = ad7794_channels,
		.num_channels = ARRAY_SIZE(ad7794_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL |
			AD7793_FLAG_HAS_REFSEL |
			AD7793_FLAG_HAS_VBIAS |
			AD7793_HAS_EXITATION_CURRENT |
			AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7795] = {
		.id = AD7795_ID,
		.channels = ad7795_channels,
		.num_channels = ARRAY_SIZE(ad7795_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL |
			AD7793_FLAG_HAS_REFSEL |
			AD7793_FLAG_HAS_VBIAS |
			AD7793_HAS_EXITATION_CURRENT |
			AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7796] = {
		.id = AD7796_ID,
		.channels = ad7796_channels,
		.num_channels = ARRAY_SIZE(ad7796_channels),
		.iio_info = &ad7797_info,
		.sample_freq_avail = ad7797_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL,
	},
	[ID_AD7797] = {
		.id = AD7797_ID,
		.channels = ad7797_channels,
		.num_channels = ARRAY_SIZE(ad7797_channels),
		.iio_info = &ad7797_info,
		.sample_freq_avail = ad7797_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_CLKSEL,
	},
	[ID_AD7798] = {
		.id = AD7798_ID,
		.channels = ad7798_channels,
		.num_channels = ARRAY_SIZE(ad7798_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
	},
	[ID_AD7799] = {
		.id = AD7799_ID,
		.channels = ad7799_channels,
		.num_channels = ARRAY_SIZE(ad7799_channels),
		.iio_info = &ad7793_info,
		.sample_freq_avail = ad7793_sample_freq_avail,
		.flags = AD7793_FLAG_HAS_GAIN |
			AD7793_FLAG_HAS_BUFFER,
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
	},
};

static int ad7793_probe(struct spi_device *spi)
{
	struct ad7793_platform_data *pdata = spi->dev.platform_data;
	struct ad7793_state *st;
	struct iio_dev *indio_dev;
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	int ret, i, voltage_uv = 0;
=======
	int ret, vref_mv = 0;
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

	if (!pdata) {
		dev_err(&spi->dev, "no platform data?\n");
		return -ENODEV;
	}

	if (!spi->irq) {
		dev_err(&spi->dev, "no IRQ?\n");
		return -ENODEV;
	}

	indio_dev = iio_allocate_device(sizeof(*st));
	if (indio_dev == NULL)
		return -ENOMEM;

	st = iio_priv(indio_dev);

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	st->reg = regulator_get(&spi->dev, "vcc");
	if (!IS_ERR(st->reg)) {
=======
	ad_sd_init(&st->sd, indio_dev, spi, &ad7793_sigma_delta_info);

	if (pdata->refsel != AD7793_REFSEL_INTERNAL) {
		st->reg = regulator_get(&spi->dev, "refin");
		if (IS_ERR(st->reg)) {
			ret = PTR_ERR(st->reg);
			goto error_device_free;
		}

>>>>>>> v3.8:drivers/iio/adc/ad7793.c
		ret = regulator_enable(st->reg);
		if (ret)
			goto error_put_reg;

		vref_mv = regulator_get_voltage(st->reg);
		if (vref_mv < 0) {
			ret = vref_mv;
			goto error_disable_reg;
		}

		vref_mv /= 1000;
	} else {
		vref_mv = 1170; /* Build-in ref */
	}

	st->chip_info =
		&ad7793_chip_info_tbl[spi_get_device_id(spi)->driver_data];

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	st->pdata = pdata;

	if (pdata && pdata->vref_mv)
		st->int_vref_mv = pdata->vref_mv;
	else if (voltage_uv)
		st->int_vref_mv = voltage_uv / 1000;
	else
		st->int_vref_mv = 2500; /* Build-in ref */

=======
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
	spi_set_drvdata(spi, indio_dev);
	st->spi = spi;

	indio_dev->dev.parent = &spi->dev;
	indio_dev->name = spi_get_device_id(spi)->name;
	indio_dev->modes = INDIO_DIRECT_MODE;
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	indio_dev->channels = st->chip_info->channel;
	indio_dev->available_scan_masks = st->available_scan_masks;
	indio_dev->num_channels = 7;
	indio_dev->info = &ad7793_info;
=======
	indio_dev->channels = st->chip_info->channels;
	indio_dev->num_channels = st->chip_info->num_channels;
	indio_dev->info = st->chip_info->iio_info;
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

	for (i = 0; i < indio_dev->num_channels; i++) {
		set_bit(i, &st->available_scan_masks[i]);
		set_bit(indio_dev->
			channels[indio_dev->num_channels - 1].scan_index,
			&st->available_scan_masks[i]);
	}

	init_waitqueue_head(&st->wq_data_avail);

	ret = ad7793_register_ring_funcs_and_init(indio_dev);
	if (ret)
		goto error_disable_reg;

<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
	ret = ad7793_probe_trigger(indio_dev);
	if (ret)
		goto error_unreg_ring;

	ret = iio_buffer_register(indio_dev,
				  indio_dev->channels,
				  indio_dev->num_channels);
=======
	ret = ad7793_setup(indio_dev, pdata, vref_mv);
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
	if (ret)
		goto error_remove_trigger;

	ret = ad7793_setup(st);
	if (ret)
		goto error_uninitialize_ring;

	ret = iio_device_register(indio_dev);
	if (ret)
		goto error_uninitialize_ring;

	return 0;

error_uninitialize_ring:
	iio_buffer_unregister(indio_dev);
error_remove_trigger:
	ad7793_remove_trigger(indio_dev);
error_unreg_ring:
	ad7793_ring_cleanup(indio_dev);
error_disable_reg:
	if (pdata->refsel != AD7793_REFSEL_INTERNAL)
		regulator_disable(st->reg);
error_put_reg:
	if (pdata->refsel != AD7793_REFSEL_INTERNAL)
		regulator_put(st->reg);
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c

	iio_free_device(indio_dev);
=======
error_device_free:
	iio_device_free(indio_dev);
>>>>>>> v3.8:drivers/iio/adc/ad7793.c

	return ret;
}

static int ad7793_remove(struct spi_device *spi)
{
	const struct ad7793_platform_data *pdata = spi->dev.platform_data;
	struct iio_dev *indio_dev = spi_get_drvdata(spi);
	struct ad7793_state *st = iio_priv(indio_dev);

	iio_device_unregister(indio_dev);
	iio_buffer_unregister(indio_dev);
	ad7793_remove_trigger(indio_dev);
	ad7793_ring_cleanup(indio_dev);

	if (pdata->refsel != AD7793_REFSEL_INTERNAL) {
		regulator_disable(st->reg);
		regulator_put(st->reg);
	}

	iio_free_device(indio_dev);

	return 0;
}

static const struct spi_device_id ad7793_id[] = {
	{"ad7792", ID_AD7792},
	{"ad7793", ID_AD7793},
<<<<<<< HEAD:drivers/staging/iio/adc/ad7793.c
=======
	{"ad7794", ID_AD7794},
	{"ad7795", ID_AD7795},
	{"ad7796", ID_AD7796},
	{"ad7797", ID_AD7797},
	{"ad7798", ID_AD7798},
	{"ad7799", ID_AD7799},
>>>>>>> v3.8:drivers/iio/adc/ad7793.c
	{}
};
MODULE_DEVICE_TABLE(spi, ad7793_id);

static struct spi_driver ad7793_driver = {
	.driver = {
		.name	= "ad7793",
		.owner	= THIS_MODULE,
	},
	.probe		= ad7793_probe,
	.remove		= ad7793_remove,
	.id_table	= ad7793_id,
};
module_spi_driver(ad7793_driver);

MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
MODULE_DESCRIPTION("Analog Devices AD7792/3 ADC");
MODULE_LICENSE("GPL v2");
