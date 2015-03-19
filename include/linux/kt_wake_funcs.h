#include <linux/kernel.h>

#include <linux/of_gpio.h>
#include <linux/regulator/consumer.h>
#include <linux/input.h>
#include <linux/delay.h>
#include <linux/i2c.h>
#include "../../drivers/input/touchscreen/synaptics/synaptics_i2c_rmi.h"
#include "../../drivers/sensorhub/stm/ssp.h"

extern int SYN_I2C_RETRY_TIMES;
extern int GPIO_CFG_KT;

extern struct ssp_data *main_prox_data;

extern unsigned int x_lo ;
extern unsigned int y_lo;
extern unsigned int x_onethird;
extern unsigned int x_twothird;
extern unsigned int x_hi;
extern unsigned int y_hi;

extern unsigned int screen_wake_options; // 0 = disabled; 1 = s2w; 2 = s2w only while charging; 3 = dtap2wake; 4 = dtap2wake only while charging; 5 = both
extern unsigned int screen_wake_options_prox_max;
extern unsigned int screen_wake_options_debug;
extern unsigned int screen_wake_options_when_off;
extern unsigned int screen_sleep_options; // 0 = disabled; 1 = enabled

extern bool screen_is_off;
extern bool call_in_progress;
extern unsigned int is_charging;

extern unsigned int wake_start;

extern void check_touch_off(int x, int y, unsigned char state, unsigned char touch_count);
extern void check_touch_on(int x, int y, unsigned char state, unsigned char touch_count);

extern void wake_funcs_sysfs(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client);

extern void wake_funcs_init(void);
extern void wake_funcs_set_prox(bool state);

void pwr_trig_fscreen(void);

extern bool wake_options_okto_enable(void);

extern void set_call_in_progress(bool state);
