/*
**
** Copyright (C), 2000-2012, OPPO Mobile Comm Corp., Ltd
** All rights reserved.
** 
** VENDOR_EDIT
** 
** Description: fastchg pic16f1503 driver
** 
** from
** kernel/drivers/power/pic1503.c
**
** Copyright (C) 2007 Google, Inc.
**
** This software is licensed under the terms of the GNU General Public
** License version 2, as published by the Free Software Foundation, and
** may be copied, distributed, and modified under those terms.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
** 
** 
** --------------------------- Revision History: --------------------------------
** <author>		                      <data> 	<version >  <desc>
** ------------------------------------------------------------------------------
** liaofuchun@EXP.Driver	  2013/12/22   	1.1	    create file
** liaofuchun@EXP.Driver	  2013/12/30 	1.2	    add 3A/2A charging
** liaofuchun@EXP.Driver	  2013/01/10 	1.3	    improve 1503 fw update,add battery connection detect,decrease current quickly
** liaofuchun@EXP.Driver	  2013/01/11 	1.4	    add battery connection detect and battery type	
** liaofuchun@EXP.Driver	  2013/01/21    1.5     add current_level(3A 3.25A 3.5A ... 5A) and circuit_res(20mohm 25mohm .... 80mohm)
** liaofuchun@EXP.Driver	  2013/01/23    1.6     optimize code space
** liaofuchun@EXP.Driver	  2013/02/14	1.7		iusbmax should be < (2.5A ~ 2.8A) when act as normal adapter,calculate usb circuit resistance every 500mA
** ------------------------------------------------------------------------------
 */
 
 #include <htc.h>
#define MCP4561_WRITE_ADDR 0x5C
#define MCP4561_READ_ADDR 0x5D
#define REG_WRITE			0x00
#define REG_INCREASE	0x01
#define REG_DECREASE	0x02
#define	REG_READ		0x03
//char tx_buf[8]={1,0,1,0,0,0,0,0};
char tx_buf[8] = {0x0};
char rx_buf[10] = {0x0};
//int value_debug = 0;
char interrupt_finished = 0;
//char tm2_count = 0;
//char is_i2c_fail = 0;
//char tm1_count = 0;
char uart_data[2] = {0};
char resistor_now = 0;
//char battery_type = 0;
char circuit_res = 0;

#define ADC_RA2 	0
#define ADC_RC2		1
#define ADC_RC3		2

#define FASTCHG_STARTED		1
#define FASTCHG_NOTSTARTED	0

int adc_get(char adc_chan,char long_delay);
void current_set(int current_low,int current_high,char is_fastchg);
void resistor_set(char data);
void osc_init(void)
{
	OSCCON = 0x68;	//fosc = 4MHz
}

void port_init(void)
{
	//deinit uart
	TXSTA = 0X2;
	SPBRG = 0x0;
	RCSTA = 0x0;
	//config RC4 output digital I/O ----CLK --->MCU(RA5)
	RC4 = 0;
	TRISC4 = 0;	//set output
	LATC4 = 0;	//lfc add later
	RC4 = 1;	//pull up RC4(D+)

	//config RC5 output digital I/O -----DATA ----->MCU(RC5)
	RC5 = 0;
	TRISC5 = 0;	//set output
	LATC5 = 0;
	RC5 = 1;	//pull up RC5(D-)

	//nWPUEN = 0;
	//WPUC5 = 1;	//enable wake_pullup

	//config RC5 input digital I/O
	//TRISC5 = 1;	//set rc5 input
	//LATC5 = 0;

	//config RA4/RA5 output digital I/O
	TRISA4 = 0;	//set output
	ANSA4 = 0;	//set digital I/O
	LATA4 = 0;
	RA4 = 0;

	TRISA5 = 0;	//set RA5 output
	//RA5 = 0;	//lfc del later
	LATA5 = 0;
	RA5 = 0;

	tx_buf[0] = 1;
	tx_buf[1] = 0;
	tx_buf[2] = 1;
}

void wdt_init(void)
{
	SWDTEN = 1;	//enable wdt
	WDTCON = 0x16;	//feed wdt every 2s
}
void delay_10us(void)
{
	#asm;
	NOP;
	NOP;
	NOP;
	NOP;
	NOP;
	NOP;
	#endasm;
}

void delay_24us(void)
{
	delay_10us();
	delay_10us();
}

void delay_44us(void)
{
	delay_10us();
	delay_10us();
	delay_10us();
	delay_10us();
}
void delay_100us(void)
{
	delay_44us();
	delay_44us();
	#asm;
	NOP;
	NOP;
	NOP;
	NOP;
	#endasm;
}

void delay_200us(void)
{
	char i = 0;
	for(i=0;i<23;i++){
		#asm;
		NOP;
		#endasm;
	}
}

void delay_300us(void)
{
	char i = 0;
	for(i=0;i<33;i++){
		#asm;
		NOP;
		#endasm;
	}	
}

void delay_500us(void)
{
	char i = 0;
	for(i=0;i<55;i++){
		#asm;
		NOP;
		#endasm;
	}	
}

void delay_800us(void)
{
	char i = 0;
	for(i=0;i<88;i++){
		#asm;
		NOP;
		#endasm;
	}	
}
/*
void delay_1ms(void)
{
	char i = 0;
	for(i=0;i<110;i++){
		#asm;
		NOP;
		#endasm;
	}
}
*/
void delay_2ms(void)	//physical test:1.96ms
{
	char i = 0;
	for(i =0;i < 240;i++){
		#asm;
		NOP;
		#endasm;	
	}
}

/*
void delay_2ms(void)	//phycical test:1ms
{
	char i = 0;
	for(i = 222;i > 0;i--){
		#asm;
		NOP;
		#endasm;	
	}
}
*/

void delay_1ms(void)		//delay_1ms:physical test->0.98ms
{
	char i = 0;
	for(i = 242;i > 0;i--){
		#asm;
		NOP;
		#endasm;	
	}	
}

//physical test:n=2->1.98ms;n=4->3.92ms;n=8->7.7ms;n=20->19.4ms;n=200->198ms
void delay_nms(char n)
{
	char i = 0;
	for(i = n;i > 0;i--){
		delay_1ms();
	}
}
void delay_20ms(void)
{
	int i;
	for(i=0;i<1250;i++){
		#asm;
		NOP;
		#endasm;
	}
}

/*
void delay_2nms(char n)
{
	char i = 0;
	for(i = 0;i < n;i++){
		delay_2ms();
	}
}
*/
void delay_2nms(char n)
{
	char i = 0;
	for(i = n;i > 0;i--){
		delay_2ms();
	}
}

void delay_107ms(void)	
{
	char i = 0;
	for(i =0;i < 5;i++){
		delay_20ms();
	}
}


void delay_800ms(void)	//physical test:812ms
{
	char i = 0;
	for(i = 0;i < 38;i++){
		delay_20ms();
	}
}

void delay_500ms(void)
{
	unsigned int i = 0;
	for(i=0;i<32000;i++){
		#asm;
		NOP;
		#endasm;
	}
}

void enter_bootloader_mode(void)
{
	if((uart_data[0] == 0x5a) && (uart_data[1] == 0xd2)){
		GIE = 0;
		EEPGD = 1;
		CFGS = 0;
		WREN = 1;
		//LWLO = 1;
		FREE = 1;
		EEADRH = 0x7;
		EEADRL = 0xFF;
		//FREE = 1;	//erase
		//WREN = 1;
		EECON2 = 0x55;
		EECON2 = 0xAA;
		WR = 1;
		while(WRERR);
		while(FREE);
		//delay_2ms();
		//delay_nms(2);
		delay_1ms();
		delay_1ms();
		WREN = 0;
		//send 0x5a to pc
		TXREG = 0xa5;
		while(!TXIF);
		//delay_800ms();
		//delay_20ms();
		delay_1ms();
		delay_1ms();
		//delay_1ms();
		//delay_1ms();
		//delay_1ms();
		//delay_1ms();
		//delay_1ms();
		//TXIF = 0;
		TXEN = 0;
		//TXIF = 0;
		//TXEN = 0;
		#asm;
		RESET;
		#endasm;
	} else if(uart_data[0] == 0x3d) {
		TXREG = 0x02;//version 0x02
		while(!TXIF);
		delay_1ms();
		delay_1ms();
		#asm;
		RESET;
		#endasm;
	}
	return ;
}
/*
void delay_800ms(void)	//physical test:837ms
{
	unsigned int i = 0;
	for(i=0;i<60000;i++){
		#asm;
		NOP;
		#endasm;
	}
}
*/

void set_rc5_output(void)
{
	RC5 = 1;
	TRISC5 = 0;	//set output
}

void set_rc5_input(void)
{
	TRISC5 = 1;	//set input
}

void adapter_tx_data(char *buf)
{
	char i;

	set_rc5_output();
	delay_44us();
	//the code above cost: 70 words
	for(i = 0; i < 8; i++){
		//RC5:DAT	RC4:CLK
		RC4 = 0;
		RC5 = buf[i];
		//delay_10us();
		delay_10us();
		RC4 = 1;
		delay_500us();
	}
	return ;
}

void adapter_rx_data(char *buf)
{
	char i;
	set_rc5_input();
	delay_44us();
	for(i = 0; i < 10; i++){
		RC4 = 0;
		delay_10us();
		RC4 = 1;

		if(i==0){
			//delay_2ms();	//2.8ms is not enough in ask_mcu_is_vbus_ok,3ms is OK,4ms is more OK
			//delay_2ms();
			delay_nms(4);
		}
		else{
			delay_500us();
		}
		buf[i] = RC5;
	}
	return ;
}

char is_recv_data_legal(char *buf)	//adjust bit0-2
{
	if((buf[0]==1) && (buf[1] == 0) && (buf[2] == 1))
		return 1;
	return 0;		
}

void tell_mcu_get_volt(void)
{
	//char tx_buf[8] = {1,0,1,0,0,0,1,0};
	//tx_buf[0] = 1;
	//tx_buf[1] = 0;
	//tx_buf[2] = 1;
	tx_buf[3] = 0;
	tx_buf[4] = 0;
	tx_buf[5] = 0;
	tx_buf[6] = 1;
	//tx_buf[7] = 0;
	//set_rc5_output();
	adapter_tx_data(tx_buf);
}

int get_batt_vol(char *buf)
{
	int vol = 0;
	//set_rc5_input();
	//value_debug = value_debug + 8;
	//if(value_debug < 0)
	//	return 1;
	adapter_rx_data(buf);
	//buf[3]=1->1503 allow chg or charging,buf[3]=0->1503 stop fastchg
	if(is_recv_data_legal(buf) && buf[3]){
		//vol = (buf[4]<<4)|(buf[5]<<3)|(buf[6]<<2)|(buf[7]<<1)|buf[8];
		//vol = vol * 31 + 3400;	//mistake 15mv
		//vol = (buf[4]<<3)|(buf[5]<<2)|(buf[6]<<1)|buf[7];
		//vol = vol * 100 + 3400;
		//vol = (buf[4]<<5)|(buf[5]<<4)|(buf[6]<<3)|(buf[7]<<2)|(buf[8]<<1)|buf[9];
		//the codes as following can reduce 46words(88 - 42)
		vol = buf[4] << 5;
		vol = vol | (buf[5] << 4);
		vol = vol | (buf[6] << 3);
		vol = vol | (buf[7] << 2);
		vol = vol | (buf[8] << 1);
		vol = vol | buf[9];
		vol = vol * 16 + 3404;	//mistake 8mv
		return vol;
	}
	return 0;			
}

void ask_mcu_is_vbus_ok(void)
{
	//char tx_buf[8] = {1,0,1,0,0,1,0,0};
	tx_buf[3] = 0;
	tx_buf[4] = 0;
	tx_buf[5] = 1;
	tx_buf[6] = 0;
	//tx_buf[7] = 0;
	//set_rc5_output();
	adapter_tx_data(tx_buf);	
}

//char value_debug1 = 5;
//char value_debug2 = 6;
//char value_debug3 = 7;
char get_is_vbus_ok(char *buf)
{
	//set_rc5_input();
	char valid_data = 0;
	adapter_rx_data(buf);

	if(!is_recv_data_legal(buf))
		return 0;
	valid_data = (buf[4] << 1) | buf[5];
	if(valid_data == 0x3)		//'11'
		return 2;		//vbus ok
	else if(valid_data == 0x2)	//'10'
		return 3;		//vbus too high
	else if(valid_data == 0x1)	//'01'
		return 1;		//vbus too low
	else						//'00'
		return 0;		//data error
	/*if((buf[4]==1) && (buf[5]==1))
		return 2;	//vbus ok
	else if((buf[4]==1) && (buf[5]==0))
		return 3;	//vbus too high
	else if((buf[4]==0) && (buf[5]==1))
		return 1;	//vbus too low
	else
		return 0;	//data error
	*/
}

void ask_mcu_fastchg_ornot(void)
{
	//char tx_buf[8]= {1,0,1,0,1,0,0,0};
	tx_buf[3] = 0;
	tx_buf[4] = 1;
	tx_buf[5] = 0;
	tx_buf[6] = 0;
	//tx_buf[7] = 0;
	//set_rc5_output();
	//delay_20ms();
	adapter_tx_data(tx_buf);
}

char get_fastchg_ornot(char *buf)
{
	adapter_rx_data(buf);
	//buf[3]:1->allow_chg,0->forbid fastchg
	//buf[5][6][7][8][9]:circuit resistor
	if(!is_recv_data_legal(buf))
		return 0;
	if(!buf[3])	//forbid to fastchg
		return 0;
	circuit_res = buf[5] << 4;
	circuit_res = circuit_res | (buf[6] << 3);
	circuit_res = circuit_res | (buf[7] << 2);
	circuit_res = circuit_res | (buf[8] << 1);
	circuit_res = circuit_res | buf[9];
	return 1;
/*
	//buf[4]/buf[5]:battery_type,buf[5]:0->2700mAh 1->3000mAh
	battery_type = buf[5];
	//lfc add for debug end
	if(!is_recv_data_legal(buf))
		return 0;	//data is illegal
	if(buf[7])
		return 1;	//allow to fastchg
	else
		return 0;	//forbid to fastchg
*/
}

void ask_mcu_stop_fastchg(void)
{
	//char tx_buf[8] = {1,0,1,0,0,1,1,0};
	tx_buf[3] = 0;
	tx_buf[4] = 0;
	tx_buf[5] = 1;
	tx_buf[6] = 1;
	//tx_buf[7] = 0;
	//set_rc5_output();
	//delay_44us();	//for debug
	adapter_tx_data(tx_buf);
}

char get_mcu_stop_fastchg(char *buf)
{
	//set_rc5_input();
	adapter_rx_data(buf);

	if(!is_recv_data_legal(buf)){
		return 0;	//data error
	}
	//buf[4]:1 -> stopped, buf[4]:0 -> running
	if(buf[4] == 1){
		return 1;	//stopped
	}
	else
		return 2;	//running
/*
	if((buf[4]==0) && (buf[5]==1)) //buf[4-5]:01(stopped)
		return 1;
	else if((buf[4]==1) && (buf[5]==0))	//buf[4-5]:10(running)
		return 2;
	else
		return 0;	//data error
*/
}

void tell_mcu_usb_badconnect(void)
{
	tx_buf[3] = 1;
	tx_buf[4] = 0;
	tx_buf[5] = 0;
	tx_buf[6] = 1;
	//tx_buf[7] = 0;
	//set_rc5_output();
	adapter_tx_data(tx_buf);
}

char get_mcu_usb_badconnect(char *buf)
{
	//set_rc5_input();
	adapter_rx_data(buf);
	if(!is_recv_data_legal(buf))
		return 0;
	return 1;
}

void ask_mcu_current_level(void)
{
	tx_buf[3] = 0;
	tx_buf[4] = 0;
	tx_buf[5] = 1;
	tx_buf[6] = 1;
	//tx_buf[7] = 0;
	//set_rc5_output();
	adapter_tx_data(tx_buf);
}

#define CURRENT_MIN_3000MA		980		//3000/3.06
#define CURRENT_ATTACH_250MA	82		//250/3.06 = 82
#define CURRENT_ATTACH_300MA	98

int current_level_low = 0,current_level_high = 0;
//int current_array[26] = {850,948,778,1013,980,1078,
//		1046,1144,1111,1209,1176,1275,1242,1340,1307,1405,
//		1372,1471,1438,1536,1503,1601,1569,1667,1634,1732};

char get_mcu_current_level(char *buf)
{
	char current_level = 0;
	//set_rc5_input();
	adapter_rx_data(buf);
	if(!is_recv_data_legal(buf))
		return 0;
	//current_level = (buf[6] << 3)|(buf[7] << 2)|(buf[8] << 1)|buf[9];
	/*current_level = buf[6] << 3;
	current_level = current_level | (buf[7] << 2);
	current_level = current_level | (buf[8] << 1);
	current_level = current_level | buf[9];*/

	current_level = buf[7] << 2;
	current_level = current_level | (buf[8] << 1);
	current_level = current_level | buf[9];
 
	//if(buf[3] || buf[4] || buf[5] || buf[6]){
	//the codes as following can reduce 2 words than the codes above
	if((buf[3] == 1) || (buf[4] == 1) || (buf[5] == 1) || (buf[6] == 1)){
		current_level_low = 1634;		//5000mA
		current_level_high = 1732;	//5300mA
		return 2;
	}

	//current_low = CURRENT_MIN + (current_level * 250)/3.06 = CURRENT_MIN + current_level * 82
	current_level_low = CURRENT_MIN_3000MA + (current_level * CURRENT_ATTACH_250MA);
	current_level_high = current_level_low + CURRENT_ATTACH_300MA;
	return 1;
}

void resistor_increase();
void resistor_decrease();
char ask_adjust_vbus(void)
{
	char rc = 0;
	//char err_count = 0;
	//ask mcu is vbus_vol ok?
	while(rc != 2){
		asm("clrwdt");
		//delay_20ms();
		//delay_2nms(10);
		delay_nms(20);
		ask_mcu_is_vbus_ok();
		rc = get_is_vbus_ok(rx_buf);
		if(rc == 2)	//vbus is ok
			return 1;
		else if(rc == 1){ //vbus too low
			//vbus_set_primary(vbus + 50);	//set vbus vol:vbus + 50
			resistor_increase();
		}else if(rc == 3){	//vbus too high
			//vbus_set_primary(vbus - 50);
			resistor_decrease();
		}else if(rc == 0){	//when get vbus vol fail,repeat 50 times
			//err_count++;
			//if(err_count > 10){
				#asm;
				RESET;
				#endasm;
			//}	
		}
	}	
}

/*
void start_fastchg(void)
{
	char rc = 0;
	int vbat,vbus;
	//char i = 0;
	//code:ask_mcu_fastchg_ornot every 1s by timer2,"TMR2ON = 0" is needed
	//disable timer2
	//TMR2ON = 0;
	while(1){
		current_set();	//set goal current:4050mA
		//for(i = 0;i < 10;i++){
		//delay_800ms();
		delay_20ms();
		delay_20ms();
		delay_20ms();
		delay_20ms();
		delay_20ms();
		//}
		ask_mcu_stop_fastchg();
		rc = get_mcu_stop_fastchg(rx_buf);
		if(rc == 2){	//don't stop charging
			tell_mcu_get_volt();
			vbat = get_batt_vol(rx_buf);
			value_debug = vbat;
			if(vbat){
				vbus = adc_get(2);
				vbus = (vbus * 11)/14 + (2 * vbus);	//mistake:14mv
				value_debug = vbus;	//just for debug
				if(vbus > (vbat + 600)){	//read vbus vol by rc3
					RA4 = 0; //pull down vbus
					//when adapter plugged out,vbus will be 5.1V,the commu between adapter and 1503 will fail
					//don't commu with 1503 here
					//tell_mcu_usb_badconnect();	
					//get_mcu_usb_badconnect(rx_buf);
					//while(1);	//just for debug
					#asm;	//usb plugged out,reset device
					RESET;
					#endasm;	
				}	
			}else{	//get vbat fail,reset device
				//while(1);	//just for debug
				#asm;
				RESET;
				#endasm;
			}
		}else{	//stop charging or commu fail
			//tell_mcu_usb_badconnect();
			//get_mcu_usb_badconnect(rx_buf);
			//while(1);	//just for debug
			#asm;
			RESET;
			#endasm;
		}	
		delay_20ms();
	}
	value_debug = 5;
}
*/

//#define CURRENT_1500MA		490
//#define	CURRENT_1000MA		327
#define CURRENT_500MA		164
#define CURRENT_1750MA		572		
	
void start_fastchg(void)
{
	char rc = 0;
	int vbat,vbus;	//vbus must be int type,not unsigned int type
	char twoA = 0;
	char threeA = 0;
	char ovp_count = 0;
	int vol_limit = 800;
	char skip_count = 0;
	int vol_limit_base = 200;
	char ask_current_count = 0; 

	ask_mcu_current:
		asm("clrwdt");
		//delay_2nms(20);	//delay_40ms
		delay_nms(40);
		ask_mcu_current_level();
		rc = get_mcu_current_level(rx_buf);
		if(!rc){
			#asm;
			RESET;
			#endasm;
		} else if(rc == 2){		//if current is 5A~5.3A,ask 3 times
			ask_current_count++;
			if(ask_current_count < 3)
				goto ask_mcu_current;
		}
	vol_limit_base = 185 + 5 * circuit_res;
	while(1){
		asm("clrwdt");
		//current_set(1307,1405);	//set goal current:4050mA
		//delay_20ms();	//it is must,delete it 110ms
		//delay_10ms();	//delay10ms is must,add it,138ms
		tell_mcu_get_volt();
		vbat = get_batt_vol(rx_buf);
		//asm("clrwdt");	//it maybe deleted later
		if(vbat){
			if(skip_count < 30){	//detect vbus-vbat (usb connect) every 400ms
				skip_count++;
				goto adjust_current;
			}
			skip_count = 0;
			vbus = adc_get(ADC_RA2,0);
			vbus = (vbus - CURRENT_1750MA)/CURRENT_500MA;
			if(vbus > 0){	//it shouldn't be if(vbus) == if(vbus != 0)
				vol_limit = (vol_limit_base >> 1) * (vbus + 4);
			} else {
				vol_limit = 2 * vol_limit_base;
			}
			delay_44us();	//it shouldn't be delay_2ms
			vbus = adc_get(ADC_RC3,0);
			vbus = (vbus * 11)/14 + (2 * vbus);	//mistake:14mv
			if(vbus > (vbat + vol_limit)){	//read vbus vol by rc3
				ovp_count++;
				if(ovp_count > 5){	//40ms * skip_count * ovp_count = 4s
					RA4 = 0; //pull down vbus
					//when adapter plugged out,vbus will be 5.1V,the commu between adapter and 1503 will fail
					//don't commu with 1503 here
					tell_mcu_usb_badconnect();	
					RC4 = 0;
					delay_10us();
					RC4 = 1;
					delay_44us();
					//get_mcu_usb_badconnect(rx_buf);
					//while(1);	//just for debug
					#asm;	//usb plugged out,reset device
					RESET;
					#endasm;
				} 
			} else {
				ovp_count = 0; 
			}
			adjust_current:
				//delay_20ms();	//it is must,delete it 110ms
				//delay_2nms(4);	//delay_8ms
				delay_nms(8);
				if(twoA){
					current_set(654,752,FASTCHG_STARTED);	//2A
				} else if(threeA && (vbat < 4321)){
					current_set(980,1078,FASTCHG_STARTED);	//3A
				} else if(vbat < 4300){
					current_set(current_level_low,current_level_high,FASTCHG_STARTED);
					//current_set(1634,1732,FASTCHG_STARTED);
					/*if(battery_type)	//3000mAh
						current_set(1470,1568);	//4.5A
					else		//2700mAh
						current_set(1307,1405);	//4A
					*/
				} else if((vbat > 4299) && (vbat < 4321)){
					threeA = 1;	
					current_set(980,1078,FASTCHG_STARTED);	//3A
				} else if(vbat > 4320){
					twoA = 1;
					current_set(654,752,FASTCHG_STARTED);	//2A
				}		 
		}else{	//get vbat fail,reset device
				//while(1);	//just for debug
			#asm;
			RESET;
			#endasm;
		}
	}
}

void timer2_init();
void is_vbus_short(char is_fastchg);

#define FiveV_5A_MODE		5

char commu_with_mcu(void)
{
	char rc = 0;
	//int vbat;
	//startchg_ornot:
		asm("clrwdt");
		ask_mcu_fastchg_ornot();
		rc = get_fastchg_ornot(rx_buf);
		if(rc){	// rc = 1,1503 allow to start fastchg
			/*tell_mcu_get_volt();
			vbat = get_batt_vol(rx_buf);
			//vol = get_batt_vol(rx_buf);
			if(vbat){	//get bat_vol ok
				//vbus_set_primary(vbat + 200);	//set vbus vol:vbat + 200
				resistor_set(0,150);	//forbid to use resistor_set(0,100),because it will over_current quickly
			} else {
				#asm;
				RESET;
				#endasm;
				//goto startchg_ornot;
			}*/
			if(circuit_res == FiveV_5A_MODE) {
				resistor_set(255);

				while(1) {
					asm("clrwdt");
					ask_mcu_fastchg_ornot();
					rc = get_fastchg_ornot(rx_buf);
					if(rc && circuit_res == FiveV_5A_MODE) {
						delay_nms(100);
						is_vbus_short(1);
					} else {
						#asm;
						RESET;
						#endasm;
					}
				}
			} else {
				resistor_set(150);
				rc = ask_adjust_vbus();
				if(rc){
					start_fastchg();
					return 0;	//ap allow to start fastchg
				}
				else{
					#asm;
					RESET;
					#endasm;
					//goto startchg_ornot;
				}
			}
			
		}
		return 1;	//ap forbid to startchg or cmmu fail
		/*
		else{	// rc = 0,1503 forbid to start fastchg
			//timer2_init();
			//TMR2ON = 1;	//enable timer2
			delay_800ms();
			goto startchg_ornot;
		}
		*/		
}

/*************i2c master mode function begin***********/

void interrupt isr(void)	//void interrupt **** is the entrance for all the interrupts
{
	static char i = 0;	//for test
	//static char uart_data[2] = {0};
	//static char tm2_count = 0;
	if(SSP1IF){	//i2c interrupt
		SSP1IF = 0;
		interrupt_finished = 0;
	}
	if(RCIF){
		RCIF = 0;
		uart_data[i] = RCREG;
		i++;
		if(i > 1)
			i = 0;
		enter_bootloader_mode();
	}
/*
	if(TMR2IF){		//timer2 interrupt
		TMR2IF = 0;
		tm2_count++;
		//feedwdt every 3.072s
		if(tm2_count > 11){
			tm2_count = 0;
			#asm;
			CLRWDT;
			#endasm;
		}
		/*
		code:ask_mcu_fastchg_ornot every 1s by timer
		if(tm2_count > 3){	// 256ms * 4 ~= 1s	//physical test:
			TMR2ON = 0;	//just for debug,it should be deleted later
			tm2_count = 0;
			commu_with_mcu();
			//TMR2ON = 0;	//disable timer
			//TMR2ON = 1;
		
		}
		*/
	//}
/*
	if(TMR1IF){	//tm1_count add 1,delay_time is 65536us
		TMR1IF = 0;
		tm1_count++;
		if(tm1_count > 9){	//delay_time = 0.524 * 10 = 5.24s
	//	if(tm1_count > 19){	//delay_time = 0.524 * 20 = 10.48s	
			tm1_count = 0;
			if(is_i2c_fail){
				tell_mcu_usb_badconnect();
				#asm;
				RESET;
				#endasm;
			}	
		}
	}
*/
	return ;	
}

void timer1_init(void)	//1 cycle delay_time = 65536us * 8 = 524.28ms
{
	TMR1ON = 0;
	T1CON = 0x30;	//1/4 fosc,prescaler->1:8
	T1GCON = 0;	//it maybe deleted later
	TMR1H = 0;
	TMR1L = 0;
	TMR1IF = 0;	//clear timer1 interrupt flag
	TMR1IE = 1;
	PEIE = 1;
	GIE = 1;
}

void timer2_init(void)
{
	TMR2ON = 0;	//make sure timer2 off
	PR2 = 0xFF;	//Load period register with decimal 250,it will match with TMR2
	//T2CON = 0x01;	//postscaler->1:1,prescaler->1:4,timer2 off in init
	//T2CON = 0x00;	//postscaler->1:1,prescaler->1:1,timer2 off in init
	T2CON = 0x73;	//postscaler->1:15,prescaler->1:64,timer2 off in init,timer_delay:PR2 * 64 * 15 *1us = 0.25s
	TMR2IF = 0;	//clear TIMER2 interrupt flag
	TMR2IE = 1;	//enable timer2 interrupt
	PEIE = 1;	//enable Peripheral interrupt
	GIE = 1;
}

int i2c_init()
{
	//enable MSSP interrupt
	//INTCON = 0b11000000;
	//SSP1IE = 1;
	//PEIE = 1;
	//GIE = 1;
	//RC0 SCL,RC1 SDA

	//initial I/O pin
	ANSC0 = 0;	//set RC0 digital I/O
	ANSC1 = 0;	//set RC1 digital I/O
	TRISC0 = 1;	//set RC0 input
	TRISC1 = 1;	//set RC1 input
	LATC1 = 0;
	
	//initial hardware begin
	SSP1CON1 = 0x00;
    SSP1CON2 = 0x00;
    SSP1CON1 = 0x28;	//i2c master mode,fosc/4
	SSP1STAT = 0x80;	//disable slew rate
	//SCL CLK: 1)FOSC = 500KHz,SSP1ADD=0x09 2)FOSC=2MHz,SSP1ADD=0x27
	//SSP1ADD = 0x27;		//setup SCL clk:Fosc/((SSP1ADD+1)*4) -----> it will fault
	SSP1ADD = 0x09;			//setup SCL clk:Fosc/(4*(0x09+1))
    SSP1IF = 0;	//MSSP interrupt flag idle
	//enable weak pull up
	//nWPUEN = 0;
	//WPUB6 = 1;
	//initial hardware end
}
void i2c_start(void)
{
	asm("clrwdt");
	SSP1IE = 1;		//SSP1IE GIE must be setted to 1 in i2c_start,i2c need to continous write/read
	PEIE = 1;
	GIE = 1;
	SSP1IF = 0;	//it may be deleted later
	interrupt_finished = 1;
	SEN = 1;
	while(SEN);
	while(interrupt_finished);
	asm("clrwdt");
}

void i2c_restart(void)
{
	asm("clrwdt");
	interrupt_finished = 1;
	RSEN = 1;
	while(RSEN);
	while(interrupt_finished);
	asm("clrwdt");
}

void i2c_stop(void)
{
	asm("clrwdt");
	//i2c stop must wait interrupt finished,otherwise cmd_byte will not sent correctly,i2c_read will receive 0xff
	interrupt_finished = 1;
	PEN = 1;
	while(PEN);
	while(interrupt_finished);	//is needed
	asm("clrwdt");
}

void i2c_ack(void)
{
	ACKDT = 0;
	ACKEN = 1;
	SSP1IF = 0;
	//while(ACKSTAT);
}

void i2c_noack(void)
{
	ACKDT = 1;
	ACKEN = 0;	
}
void delay_40us();
void i2c_write(char reg_addr)
{
	asm("clrwdt");
	//step 1:send MCP4561 i2c slave addr to mcp4561
	interrupt_finished = 1;
	SSP1BUF = MCP4561_WRITE_ADDR;	//send mcp4561 slave addr to bq27541
	while(BF);
	//SSP1BUF = 0xAA;
	//R_nW = 0;	//set R_nw 1
	//ssp_idle();
	while(ACKSTAT);
	while(interrupt_finished);	//it must be added,else reg_addr can't be sent correctly
	//value_debug = SSP1IF;	//just for debug,test whether PIC1503 set SSP1IF after 9th clk(set to 1 is ok)
	SSP1BUF = reg_addr;
	while(BF);
	while(ACKSTAT);	
	asm("clrwdt");
}

/*
int i2c_read()		//lfc add remark:don't split i2c_start i2c_ack i2c_stop from i2c_read,maybe something wrong will happen
{
	int retval;
	
	RSEN = 1;
	while(RSEN);
//	while(!SSP1IF);
	SSP1IF = 0;
	//while(BF);
	SSP1BUF = MCP4561_SLAVE_ADDR;
	while(BF);
	while(R_nW);
	
	//R_nW = 1;
	while(ACKSTAT);
	
	//while(!allow_to_rx);
	//allow_to_rx = 0;
	SSP1IF = 0;
	//while(!value_debug);	//for debug
	RCEN = 1;	//enable receive
	while(RCEN);
	while(SSP1IF);	//pic1503 will clear SSP1IF after 8th clock

	retval = SSP1BUF;
	while(BF);
	//allow_to_rx = 0;
	first_byte = retval;
	//send ack begin
	interrupt_finished = 1;
	ACKDT = 0;
	ACKEN = 1;
	//send ack end
	//while(!allow_to_rx);
	value_debug = SSP1IF;	//just for debug
	SSP1IF = 0;	//clear SSP1IF after send ack
	while(interrupt_finished);

//step2-2:receive data twice begin
	RCEN = 1;
	while(RCEN);
	value_debug = SSP1IF;
	while(SSP1IF);
	high_byte = SSP1BUF;
	while(BF);
	retval = (high_byte << 8) | retval;;
	//just for debug begin
	value_debug = BF;
	//just for debug end

	//send ack begin
	ACKDT = 1;	//no ack	//must be ACKDT = 1 && ACKEN = 0 after i2c_read
	ACKEN = 0;	//ack idle
	//while(interrupt_finished);
	SSP1IF = 0;
//receive data twice end
//	be careful on PEN =1 
//	PEN = 1;	//don't stop after i2c read,just when not use i2c any more,can stop it
//	while(PEN);	//if add SP1IE=1 GIE =1 in i2c_start,maybe it can PEN=1 while(PEN)?
//lfc add for debug begin
	PEN = 1;	//after add SP1IE = 1 GIE = 1 in i2c_start,it's OK
	while(PEN);	//if dont't set PEN=1,mcu can't release i2c,so ap can't read bq27541
//lfc add for debug end
	return retval;
}
*/
void i2c_write_send(char reg_addr,char data)
{
	//lfc add to avoid i2c error begin
	//if i2c_write don't finish in 5s,reset 1823
	//timer1_init();
	//TMR1ON = 1;	//enable timer1
	//is_i2c_fail = 1;
	//lfc add to avoid i2c error end
	asm("clrwdt");
	//step 1:send MCP4561 i2c slave addr to mcp4561
	interrupt_finished = 1;
	SSP1BUF = MCP4561_WRITE_ADDR;	//send mcp4561 slave addr to bq27541
	while(BF);
	//SSP1BUF = 0xAA;
	//R_nW = 0;	//set R_nw 1
	//ssp_idle();
	while(ACKSTAT);
	while(interrupt_finished);
	//value_debug = SSP1IF;	//just for debug,test whether PIC1503 set SSP1IF after 9th clk(set to 1 is ok)
	interrupt_finished = 1;
	SSP1BUF = reg_addr;
	while(BF);
	while(ACKSTAT);	
	while(interrupt_finished);
	asm("clrwdt");
	//send data to mcp4561
	SSP1BUF = data;
	while(BF);
	while(ACKSTAT);
	//stop
	PEN = 1;
	while(PEN);
	asm("clrwdt");
	//lfc add begin to avoid i2c error begin
	//is_i2c_fail = 0;
	//TMR2ON = 0;
	//tm1_count = 0;
	//lfc add end

}

/*************i2c master mode function end*************/
/*	MCP4561:9-bit,use it
void resistor_set(char high_data,char low_data)
{
	//cmd and data format refer to MCP4561 P55-P59
	char reg_addr = 0;

	resistor_now = low_data;	//high_data is always 0
	reg_addr = (REG_WRITE << 2)| high_data;
	i2c_start();
	//reg_addr: bit[7-4]:addr,bit[3-2]:cmd('00' is write),bit[1]:reserve,bit[0]->data bit[8]
	i2c_write_send(reg_addr,low_data);	//reg_addr bit[]
	//i2c_start();
	//i2c_write_send(reg_addr,low_data);
}
*/

//	MCP4561:8-bit,use it
void resistor_set(char data)
{
	//cmd and data format refer to MCP4561 P55-P59
	char reg_addr = 0;

	resistor_now = data;
	reg_addr = REG_WRITE << 2;
	i2c_start();
	//reg_addr: bit[7-4]:addr(p55-56),bit[3-2]:cmd('00' is write),bit[1]:reserve,bit[0]->data bit[8]
	i2c_write_send(reg_addr,data);	//reg_addr bit[]
	//i2c_start();
	//i2c_write_send(reg_addr,low_data);
}

void resistor_increase()	//voltage is increasing
{
	char cmd_increase = REG_INCREASE << 2;//refer to MCP4561 P63
	i2c_start();
	i2c_write_send(cmd_increase,cmd_increase);
	//delay_2ms();
	resistor_now++;
}

void resistor_decrease()	//voltage is decreasing
{
	char cmd_decrease = REG_DECREASE << 2;
	i2c_start();
	i2c_write_send(cmd_decrease,cmd_decrease);
	//delay_2ms();
	resistor_now--;
}

void vbus_set_secondary(int adc_value)
{
	int vbus = 0;

	//detect RC2 AN6 vol
	vbus = adc_get(ADC_RC2,0);
	//vol district by two resistors
	//vbus = (vbus * 11)/14 + (2 * vbus);	//it is needed when calculate vol not adc_value
	//value_debug = vbus;
	
	//vbus_lowthreshold = ((vol-100) * 56)/156
	//while((vbus < (vol - 100)) || (vbus > (vol + 100))){
	while((vbus < (adc_value - 36)) || (vbus > (adc_value + 36))){
		asm("clrwdt");
		if(vbus < (adc_value - 36))
			resistor_increase();
		else if(vbus > (adc_value + 36))
			resistor_decrease();
		delay_nms(20);
		/*
		vbus = adc_get(ADC_RA2,0);
		//value_debug = vbus;
		if(vbus > 327){	// detect RA2 vol,current > 1A
			//RA4 = 0;	//close adapter output
			//while(1);
		}
		*/
		vbus = adc_get(ADC_RC2,0);
		//vbus = (vbus * 11)/14 + (2 * vbus);	//it is needed when calculate vol not adc_value
		//value_debug = vbus;
	}
}

/*
void vbus_set_secondary(int vol)
{
	int vbus = 0;
	//it can not be added,because resistor_set will run twice(refer to main())
	//resistor_set(resistor);
	//detect RC2 AN6 vol
	vbus = adc_get(ADC_RC2,0);
	//vol district by two resistors
	vbus = (vbus * 11)/14 + (2 * vbus);
	//value_debug = vbus;
	
	//vbus_lowthreshold = ((vol-100) * 56)/156
	while((vbus < (vol - 100)) || (vbus > (vol + 100))){
		asm("clrwdt");
		if(vbus < (vol - 100))
			resistor_increase();
		else if(vbus > (vol + 100))
			resistor_decrease();
		//delay_2ms();
		delay_20ms();
		vbus = adc_get(ADC_RA2,0);
		//value_debug = vbus;
		if(vbus > 327){	// detect RA2 vol,current > 1A
			//RA4 = 0;	//close adapter output
			//while(1);
		}
		vbus = adc_get(ADC_RC2,0);
		vbus = (vbus * 11)/14 + (2 * vbus);
		//value_debug = vbus;
	}
}
*/
/*
void vbus_set_primary(int voltage)
{
	resistor_set(150);	//71 words
	vbus_set_secondary(voltage);	//250 words
}
*/

/* ADC get function begin*/

void adc_sample_time_wait()
{
	#asm;
	NOP;
	NOP;
	NOP;
	#endasm;
	return ;
}

int adc_get(char adc_chan,char delay_long)
{
	int adc_result;

	asm("clrwdt");
	//RA2 RC2 RC3
//step1: PORT config
	TRISA1 = 1;
	ANSA1 = 1;
	TRISA2 = 1;	//set RA2 input
	ANSA2 = 1;	//set RA2 analog input
	TRISC2 = 1;	
	ANSC2 = 1;
	TRISC3 = 1;
	ANSC3 = 1;
//step2: ADC module config
	//ADCON1 = 0xD2;	//right justify,frc osc,external Vref(RA1)
	//ADCON1 = 0xD3;	//right justify,frc osc,refer fvr
	ADCON1 = 0xD2;//wangjc use external vref
	FVREN = 1;
	ADFVR1 = 1;	//set fvr 2.048v
	ADFVR0 = 0;
	//ADC channel:RA2(AN2) RC2(AN6) RC3(AN7)
	if(adc_chan == ADC_RA2)
		ADCON0 = 0x09;	//select RA2 ADC CHANNEL(AN2),turn on ADC
	else if(adc_chan == ADC_RC2)
		ADCON0 = 0x19;	//select RC2 ADC CHANNEL(AN6),turn on ADC
	else if(adc_chan == ADC_RC3)
		ADCON0 = 0x1D;	//select RC3 ADC channel(AN7),turn on ADC
//step3: ADC interrupt config(optional) skip it
/*
	ADCIF = 0;	//adc interrupt flag
	ADIE = 1;	//enable adc intterupt
	PEIE = 1;	//enable pherial intterupt
	GIE = 1;	//enable global intterupt
*/
//step4: wait some time for adc sample
	if(delay_long){
		delay_nms(2);
	}else{
		delay_44us();
		delay_44us();
	}
	//delay_20ms();
	GO = 1;		//ADC start
	while(GO);	//wait ADC finished
	asm("clrwdt");
	adc_result = (ADRESH << 8) | ADRESL;
	//adc_result = adc_result * (2048/1023) ~= adc_result * 2 + 1;
	adc_result = adc_result * 2 + 1;
	return adc_result;
}

/*
void current_set(int cur_goal)	//80 words
{
	int cur_now;
	cur_now = adc_get(0);
	cur_now = (cur_now * 3) + (cur_now * 3)/50;	//mistake:50mA
	while((cur_now < (cur_goal - 100)) || (cur_now > (cur_goal + 100))){
		if(cur_now < (cur_goal - 100))
			resistor_increase();
		else if(cur_now > (cur_goal + 100))
			resistor_decrease();
		cur_now = adc_get(0);
		cur_now = (cur_now * 3) + (cur_now * 3)/50;	//mistake:50mA
		value_debug = cur_now;
	}
}
*/

/*
void current_set(void)	//80 words	//4050ma
{
	int cur_now;
	char count = 0;
	cur_now = adc_get(0);
	while((cur_now < 1209) || (cur_now > 1307)){	//3.7A~4A
		if(cur_now < 1209){
			value_debug = adc_get(1);
			//if(adc_get(1) > 1723)	//detect vbus vol > 4.8V ?
			if(adc_get(1) > 1662)	//detect vbus vol > 4.63V ?
				return ;
			resistor_increase();
			//delay_2ms();
		}
		else if(cur_now > 1307){
			if(adc_get(1) < 1077)	//detect vbus vol < 3V
				return ;
			resistor_decrease();
			//delay_2ms();
		}
		
		delay_2ms();
		delay_2ms();
		delay_2ms();
		delay_2ms();
		count++;
		//80 words begin
		if(count > 9){	//commu with 1503 every 10 * 8ms + others ~= 100ms
			//lfc add for 1503 can't receive 1823 info in current_set func then reset
			//ask and get cost 11.3ms
			ask_mcu_stop_fastchg();
			if(get_mcu_stop_fastchg(rx_buf) != 2){
				#asm;
				RESET;
				#endasm;
			}
			//lfc add end
			count = 0;
		}
		//80 words end
		//delay_20ms();	//it is must,because after resistor_increase/decrease,vol can't increase/decrease quickly
		cur_now = adc_get(0);
		value_debug = cur_now;
	}
}
*/

void uart_init(void)	//just for enter bootloader mode
{
	//for firmware update
	//config RC5 input digital I/O
	//ANSC5 = 0;
	//ANSC4 = 0;		//set RC4 digital I/O
	TRISC5 = 1;		//set RC5 input	
	TRISC4 = 0;		//set RC4 ouput
	RXDTSEL = 0;	//set RC5 RX/DT func
	TXCKSEL = 0;	//set RC4 TX/CK	func
	TXSTA = 0x24;	//slave mode,send 8-bit data,high speed,have no 9th bit
	BRG16 = 0;		//use 8-bit buart-rate generator
	SPBRG = 0xC;	//set buart-rete 19.2KHz
	RCSTA = 0x90;	//enable uart,recv 8-bit data,enable recv
	RCIE = 1;		//enable uart recv int
	TXIE = 1;		//enable uart tx int
	PEIE = 1;
	GIE = 1;
}

//3.7A:1209 4A:1307 4.3A:1543
//#define SAFE_CURRENT_MAX	1634	//5A
#define SAFE_CURRENT_MAX	1699	//5.2A	//ok
//#define		SAFE_CURRENT_MAX	1797	//5.5A
void is_vbus_short(char is_fastchg)
{
	static char check_count = 0;
	if(adc_get(ADC_RC2,0) < 1077){	//detect vbus vol < 3V
		//fastchg not started,act as normal adapter,check 20ms * 10 = 200ms
		if(!is_fastchg && (check_count < 10)){
			check_count++;
			return ;	
		}
		//RA4 = 0;
		SWDTEN = 0;	//disable wdt
		resistor_set(0);
		delay_nms(50);
		RA5 = 1;
		RA4 = 0;
		//SWDTEN = 0;	//disable wdt
		//resistor_set(0);
		if(!is_fastchg){
			//if fastchg not started,enter bootloader mode
			uart_init();
		}
		while(1);
	}
}

//resistor_increase every once,current increase about 400mA
void current_set(int current_low,int current_high,char is_fastchg)	//80 words	//4050ma
{
	int cur_vbus;
//	char decrease_again = 0;
	char check_count = 0;
	static char slow_increase_count = 0;	//it must be static type
	static char slow_increase = 0;	//it must be static type
	asm("clrwdt");
	
	is_vbus_short(is_fastchg);
	cur_vbus = adc_get(ADC_RA2,0);
	if((cur_vbus < current_low) || (cur_vbus > current_high)){	//3.7A~4A
		if(cur_vbus < current_low){
			//is_vbus_short();
			if(is_fastchg){
				if(adc_get(ADC_RC3,0) > 1794){	//5V
					goto quickly_decrease_current;
				}
				if(slow_increase_count < 5){
					slow_increase_count++;
				}else if(slow_increase < 40){
					slow_increase++;
					resistor_increase();
					slow_increase_count = 0;
				}
				if(slow_increase == 40){
					slow_increase = 41;
					slow_increase_count = 5;
				}else if(slow_increase > 40){
					resistor_increase();
				}
			} else {	
				//if fastchg not started,increase voltage quickly and don't delay 20ms in quickly_decrease_current;
				//if(adc_get(ADC_RC3,0) > 1794){	//5V
				if(adc_get(ADC_RC3,0) > 1831){		//5.1V
					goto detect_vbus;
				}
				resistor_increase();
			}	
		} else if(cur_vbus > current_high){
			//is_vbus_short();
			resistor_decrease();	
		} 
	} 
	quickly_decrease_current:
		check_count++;
		cur_vbus = adc_get(ADC_RA2,1);
		if(cur_vbus > SAFE_CURRENT_MAX){				
			resistor_set(resistor_now - 9);
			is_vbus_short(is_fastchg);
			//delay_2nms(10 - check_count);
			delay_nms(20);
		}else if(check_count < 10){
			goto quickly_decrease_current;
		}
	detect_vbus:
		cur_vbus = adc_get(ADC_RC3,0);
		//if(cur_vbus > 1759){	//4.9V
		//if(cur_vbus > 1831){	//5.1V
		if(cur_vbus > 1867){	//5.2V
			resistor_decrease();
			//delay_20ms();
			//delay_2nms(10);
			delay_nms(20);
		}
}

void pic1823_init(void)
{
	osc_init();
	port_init();
	i2c_init();
	//timer2_init();
	//timer1_init();
	wdt_init();
}

const char fw_ver_ready @ 0x7FF = 0x55;

void main(void)
{
	int vbus_end_cur = 0;
	char rc = 0,detect_count = 0;

	asm("clrwdt");
	pic1823_init();
	//pull down RA4/RA5
	//RA4 = 0;	//move it to port_init();
	//RA5 = 0;
	//pull up RC4/RC5; it will produce an interrupt on 1503
	//RC4 = 1;	//move it to port_init();
	//RC5 = 1;
	//set vbus_front ~= 5.1V
	resistor_set(255);	//physical test:5.005v(210)
	//delay_800ms();	//lfc add later
	delay_nms(200);		//delay 800ms
	delay_nms(200);
	delay_nms(200);
	delay_nms(200);
	//detect vbus_end(rc3) > 2V ?
	do{
		asm("clrwdt");
		delay_nms(2);
		vbus_end_cur = adc_get(ADC_RC3,0);
		//vbus_end_cur = (vbus_end_cur * 11)/14 + (2 * vbus_end_cur);	
	}while(vbus_end_cur > 718);		//vbus_end_cur > 2V

	//vbus_set_secondary(5150);
	//vbus_set_secondary(1849);	//1849 * 156 / 56 = 5150mV
	
	//if vbus_end < 2V,pull up RA4
	RA4 = 1;
	//delay_800ms();
	//commu_with_mcu();
detect_current:
	asm("clrwdt");
	//set current:2500mA ~ 2800mA
	//if current can't acheive it,vbus vol will be 5100mv
	current_set(817,915,FASTCHG_NOTSTARTED);	
	delay_nms(20);
	vbus_end_cur = adc_get(ADC_RA2,0);	//detect RA2 vol
	if(vbus_end_cur < 326){	//current < 1A
		//pull up RC4 RC5(D+ D-)
		set_rc5_output();
		delay_44us();
		RC4 = 1;
		RC5 = 1;
		detect_count = 0;
		//asm("clrwdt");
		goto detect_current;
	/*
	} else if(vbus_end_cur > 1436){	//current > 4A
	//} else if(vbus_end_cur > 1820){		//current > 5.4A
		//oip_count++;
		//if(oip_count < 50)	//count = 50 is not enough for 14001
		//	goto detect_current;	
		RA4 = 0;
		RA5 = 1;
		SWDTEN = 0;	//disable wdt
		resistor_set(0);
		//enter bootloader mode
		uart_init();
	*/
	} else{
		//oip_count = 0;
		if(detect_count < 100){	//detect 2s
			detect_count++;
			//asm("clrwdt");
			goto detect_current;
		}
		detect_count = 100;
		rc = commu_with_mcu();
		if(rc){	// ap forbid to start fastchg or commu fail
			//asm("clrwdt");
			delay_nms(80);
			goto detect_current;
		}
	}	
	while(1);
}
