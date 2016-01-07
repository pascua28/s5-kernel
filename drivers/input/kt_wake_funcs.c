#include <linux/kt_wake_funcs.h>
#include <linux/qpnp/power-on.h>

struct qpnp_pon *screenwake_pwrdev;
DEFINE_MUTEX(scr_lock);

struct ssp_data *main_prox_data;

unsigned int x_lo = 1040 / 10;
unsigned int y_lo = 1850 / 20;
unsigned int x_onethird = (1040 / 10) * 3;
unsigned int x_twothird = (1040 / 10) * 6;
unsigned int x_hi = (1040 / 10) * 9;
unsigned int y_hi = (1850 / 20) * 19;

unsigned long last_touch_time = 0;
unsigned int wake_start = 0;
bool screen_is_off = false;
unsigned int screen_wake_options = 0; // 0 = disabled; 1 = s2w; 2 = s2w only while charging; 3 = dtap2wake; 4 = dtap2wake only while charging; 5 = both; 6 = both while charging
unsigned int screen_wake_options_prox_max = 55;
unsigned int screen_wake_options_debug = 0;
unsigned int screen_wake_options_when_off = 0;
unsigned int screen_sleep_options = 0; // 0 = disabled; 1 = dtap2sleep

void screenwake_setdev(struct qpnp_pon * pon)
{
	screenwake_pwrdev = pon;
}

void screenwake_presspwr(struct work_struct *screenwake_presspwr_work)
{
	pr_alert("POWER TRIGGER CALLED");
	//if (screen_is_off)
	//	gkt_boost_cpu_call(true, true);
	
	input_report_key(screenwake_pwrdev->pon_input, 116, 1);
	input_sync(screenwake_pwrdev->pon_input);
	msleep(250);
	input_report_key(screenwake_pwrdev->pon_input, 116, 0);
	input_sync(screenwake_pwrdev->pon_input);
	msleep(250);
	wake_start = 0;
	last_touch_time = 0;
	mutex_unlock(&scr_lock);
}
DECLARE_WORK(screenwake_presspwr_work, screenwake_presspwr);

void pwr_trig_fscreen(void)
{
	if (mutex_trylock(&scr_lock)) 
		schedule_work(&screenwake_presspwr_work);
}

void check_touch_off(int x, int y, unsigned char state, unsigned char touch_count)
{
	unsigned char prox = 0;
	if (main_prox_data != NULL)
		prox = main_prox_data->buf[PROXIMITY_RAW].prox[0];//get_proximity_rawdata(main_prox_data);
	//pr_alert("KT TOUCH2 - %d\n", prox);
	if (prox > screen_wake_options_prox_max)
		return;
	
	//sweep2wake
	if ((screen_wake_options == 1 || (screen_wake_options == 2 && is_charging) || screen_wake_options == 5 || (screen_wake_options == 6 && is_charging)) && !state)
	{
		if (screen_wake_options_debug) pr_alert("WAKE_START TOUCH %d-%d-%d\n", x, x_lo, x_hi);
		//Left to right
		if (x < x_lo)
			wake_start = 1;
		//Right to left
		if (x > x_hi)
			wake_start = 4;
	}	
	if ((screen_wake_options == 1 || (screen_wake_options == 2 && is_charging) || screen_wake_options == 5 || (screen_wake_options == 6 && is_charging)) && state)
	{
		//Left to right
		if (wake_start == 1 && x >= (x_onethird-30) && x <= (x_onethird+30))
		{
			wake_start = 2;
			if (screen_wake_options_debug) pr_alert("WAKE_START ON2 %d-%d\n", x, x_lo);
		}
		if (wake_start == 2 && x >= (x_twothird-30) && x <= (x_twothird+30))
		{
			wake_start = 3;
			if (screen_wake_options_debug) pr_alert("WAKE_START ON3 %d-%d\n", x, x_lo);
		}
		if (wake_start == 3 && x > x_hi) {
			pwr_trig_fscreen();
			if (screen_wake_options_debug) pr_alert("WAKE_START OFF-1 %d-%d\n", x, x_hi);
		}				
		//Right to left
		if (wake_start == 4 && x >= (x_twothird-30) && x <= (x_twothird+30))
		{
			wake_start = 5;
			if (screen_wake_options_debug) pr_alert("WAKE_START ON3 %d-%d\n", x, x_lo);
		}
		if (wake_start == 5 && x >= (x_onethird-30) && x <= (x_onethird+30))
		{
			wake_start = 6;
			if (screen_wake_options_debug) pr_alert("WAKE_START ON2 %d-%d\n", x, x_lo);
		}
		if (wake_start == 6 && x < x_lo) {
			pwr_trig_fscreen();
			if (screen_wake_options_debug) pr_alert("WAKE_START OFF-1 %d-%d\n", x, x_hi);
		}				
	}
	//Double Tap 2 wake
	if ((screen_wake_options == 3 || (screen_wake_options == 4 && is_charging) || screen_wake_options == 5 || (screen_wake_options == 6 && is_charging)) && !state)
	{
		bool block_store = false;
		if (last_touch_time)
		{
			if (screen_wake_options_debug) pr_alert("DOUBLE TAP WAKE TOUCH %d-%d-%ld-%ld-%d\n", x, y, jiffies, last_touch_time, touch_count);
			if (!touch_count && jiffies_to_msecs(jiffies - last_touch_time) < 2000) //(x < x_lo) && (y > y_hi) && //jiffies_to_msecs(jiffies - last_touch_time) > 50
			{
				if (screen_wake_options_debug) pr_alert("DOUBLE TAP WAKE POWER BTN CALLED %d-%d\n", x, y);
				pwr_trig_fscreen();
				last_touch_time = 0;
				block_store = true;
			}
			else
			{
				if (screen_wake_options_debug) pr_alert("DOUBLE TAP WAKE DELETE %d-%d-%ld-%ld\n", x, y, jiffies, last_touch_time);
				last_touch_time = 0;
				block_store = true;
			}
		}
		if (!last_touch_time && !block_store)
			last_touch_time = jiffies;
	}
}

void check_touch_on(int x, int y, unsigned char state, unsigned char touch_count)
{
	//Double Tap 2 Sleep
	if (screen_sleep_options == 1 && !state)
	{
		bool block_store = false;
		if (last_touch_time)
		{
			if (screen_wake_options_debug) pr_alert("DOUBLE TAP SLEEP TOUCH %d-%d-%ld-%ld-%d\n", x, y, jiffies, last_touch_time, touch_count);
			if (!touch_count && (y < 100) && jiffies_to_msecs(jiffies - last_touch_time) < 1000) //(x < x_lo) && (y > y_hi) && //jiffies_to_msecs(jiffies - last_touch_time) > 50
			{
				if (screen_wake_options_debug) pr_alert("DOUBLE TAP SLEEP POWER BTN CALLED %d-%d\n", x, y);
				pwr_trig_fscreen();
				last_touch_time = 0;
				block_store = true;
			}
			else
			{
				if (screen_wake_options_debug) pr_alert("DOUBLE TAP SLEEP DELETE %d-%d-%ld-%ld\n", x, y, jiffies, last_touch_time);
				last_touch_time = 0;
				block_store = true;
			}
		}
		if (!last_touch_time && !block_store && (y < 100))
			last_touch_time = jiffies;
	}
}

void wake_funcs_set_prox(bool state)
{
	if (main_prox_data != NULL)
	{
		char chTempbuf[4] = { 0 };
	
		s32 dMsDelay = 20;
		memcpy(&chTempbuf[0], &dMsDelay, 4);

		if (state)
		{
			if (main_prox_data->bProximityRawEnabled == false)
			{
				send_instruction(main_prox_data, ADD_SENSOR, PROXIMITY_RAW, chTempbuf, 4);
				msleep(200);
				main_prox_data->bProximityRawEnabled = state;
			}
		}
		else
		{
			if (main_prox_data->bProximityRawEnabled == true)
			{
				send_instruction(main_prox_data, REMOVE_SENSOR, PROXIMITY_RAW, chTempbuf, 4);
				msleep(200);
				main_prox_data->bProximityRawEnabled = state;
			}
		}
	}
}

void wake_funcs_init(void)
{
	mutex_init(&scr_lock);
}

bool wake_options_okto_enable(void)
{
	if ((screen_wake_options == 1 || (screen_wake_options == 2 && is_charging) || screen_wake_options == 3 || (screen_wake_options == 4 && is_charging) || screen_wake_options == 5 || (screen_wake_options == 6 && is_charging)) && !call_in_progress)
		return true;
	else
		return false;
}

