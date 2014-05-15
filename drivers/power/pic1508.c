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
** liaofuchun@EXP.Driver	  2013/12/22   	1.1	    create pic1503 file
** liaofuchun@EXP.Driver	  2013/12/30 	1.2	    add 3A/2A charging
** liaofuchun@EXP.Driver	  2013/01/10 	1.3	    improve 1503 fw update,add battery connection detect,decrease current quickly
** liaofuchun@EXP.Driver	  2013/01/11 	1.4	    add battery connection detect and battery type	
** liaofuchun@EXP.Driver      2013/01/21    1.5     adapter add current_level(3A 3.25A 3.5A.... 5A) and circuit_res(20mohm 25mohm 30mohm .... 80mohm)
** liaofuchun@EXP.Driver      2013/01/23    1.6     1)modify:mcu1503 reset after receive "usb bad connect" 2)avoid data pin are both in output direction
** liaofuchun@EXP.Driver      2013/01/25    1.7     1)not close RA5 interrupt and TMR2ON before reset 2)set debounce time in RA5 interrupt
** liaofuchun@EXP.Driver	  2013/01/26    1.8     cancel to set debounce time for RA5 int
** liaofuchun@EXP.Drvier	  2013/02/10    1.9     avoid pic1503 to keep in while(RC3){...}
** liaofuchun@EXP.Driver	  2013/02/11    1.10	modify adc value of(vbus - vbatt)

** liaofuchun@EXP.Driver      2013/02/11    1.1     create pic1508 file
** liaofuchun@EXP.Driver	  2013/02/14    1.2		when temp over 45 or under 20,report NOTIFY_TEMP_OVER to AP instead of NOTIFY_FAST_ABSENT
** ------------------------------------------------------------------------------
 */

#include <xc.h>

#define BQ27541_WRITE_ADDR 	0xAA
#define BQ27541_READ_ADDR	0xAB
#define ZERO_IN_KELVIN	 -2731
/*BQ27541 REG*/
#define BQ27541_REG_VOLT		0x08
#define BQ27541_REG_TEMP		0x06
#define BQ27541_REG_CURRENT		0x14

char high_byte = 0;
char i2c_int_finished = 1;
char recv_buf[3] = {0};
char adapter_buf[8] = {0x0};
char adapter_i = 0;
char mcu_buf[10] = {0};
char mcu_i = 0;
char adapter_data = 0;
char ap_isr_rcvd = 0;
char adapter_mcu_commu = 0;
char fw_ver_ready = 0;
char allow_chg = 0;
char commu_ap_ornot = 0;
char adapter_request_chg = 0;
char need_to_reset = 0;
int bq27541_vbatt = 0;
char battery_type = 0;
char bad_connect = 0;	//usb or battery bad connected

void adapter_commu_with_mcu(void);
void timer1_init();
void delay_20ms();

void delay_2ms(void)	//physical test:2ms
{
	char i = 0;
	for(i = 0; i < 222;i++){
		#asm;
		NOP;
		#endasm;
	}
}

void delay_600us(void)	//55:500
{
	char i = 0;
	for(i = 0;i < 65;i++){
		#asm;
		NOP;
		#endasm;
	}
}

void set_rc0_input(void)
{
	RC0 = 0;
	LATC0 = 0;
	TRISC0 = 1;
}

void set_rc0_output(void)
{
	TRISC0 = 0;		//set rc0 output
	LATC0 = 0;
	RC0 = 0;
}

void set_rc5_input(void)
{
	RC5 = 0;
	LATC5 = 0;
	TRISC5 = 1;
}

void set_rc5_output(void)
{
	RC5 = 0;
	LATC5 = 0;
	TRISC5 = 0;	//set RC5 output
}

void set_rc4_output(void)
{
	RC4 = 0;
	LATC4 = 0;
	TRISC4 = 0;	
	RC4 = 0;
	LATC4 = 0;
}

void set_rc4_input(void)
{
	RC4 = 0;
	LATC4 = 0;
	TRISC4 = 1;	
}
void delay_44us();
void notify_ap_start_tx(void)
{
	set_rc4_output();
	delay_44us();
	RC4 = 0;
	delay_20ms();
	RC4 = 1;
}

#define NOTIFY_FAST_PRESENT		0x52
#define NOTIFY_FAST_ABSENT		0x54
#define NOTIFY_ALLOW_READING_IIC	0x58
#define NOTIFY_FAST_FULL		0x5a
#define NOTIFY_FIRMWARE_UPDATE	0x56
#define NOTIFY_BAD_CONNECTED	0x59
#define NOTIFY_TEMP_OVER		0x5c

char tx_data_to_ap(char info)
{
	char data = 0;
	char bt = 0;
	char i;
	char tx_data = 0;
	int count = 0;

	asm("clrwdt");
	//lfc add for 14001 begin
	//return 2;
	//lfc add for 14001 end
	tx_data = info;	
	ap_isr_rcvd = 0;
	notify_ap_start_tx();

	//tx data func begin
	//_tx_data(tx_data);

	for( i = 0; i < 7; i++)
	{	
		//lfc add to avoid both RC0_1503 and RC5_1823 are in output direction
		if(need_to_reset && (info == NOTIFY_ALLOW_READING_IIC)){
			set_rc0_input();
		}
		//ap_isr_rcvd = 0;
		while(!ap_isr_rcvd){	//70 words. count = 10000 -> timeout:189ms
			count++;			//time for once:19us
			if(count > 10000){	//10000 is not enough
				#asm;
				RESET;
				#endasm;
			}	
			#asm;
			NOP;
			NOP;
			NOP;
			#endasm;	
		};
		count = 0;
		RC4 = (tx_data>>(6-i))&1;	//send data before pull up clk
		ap_isr_rcvd = 0;
		//while(!ap_isr_rcvd);
		//if(i != 6)
		//	while(!ap_isr_rcvd);
	}

	asm("clrwdt");
	//start ap -> mcu	//it must be 20ms(ap sleep 10ms + other 10ms) < x < 40ms(ap sleep 30ms + other 10ms)
	for(i = 0; i < 3; i++) {
		//lfc add to avoid both RC0_1503 and RC5_1823 are in output direction
		if(need_to_reset && (info == NOTIFY_ALLOW_READING_IIC)){
			set_rc0_input();
		}
		//while(!ap_isr_rcvd);
		while(!ap_isr_rcvd){
			count++;
			if(count > 10000){
				#asm;
				RESET;
				#endasm;
			}	
			#asm;
			NOP;
			NOP;
			NOP;
			#endasm;
		};
		count = 0;
		if(i == 0){		
			set_rc4_input();
			delay_44us();
		} 
		ap_isr_rcvd = 0;
		bt = RC4;
		if(i == 2){		//the third bit is battery_type,the other 2bits is ret_info
			battery_type = bt;
		} else {
			data |= (bt<<(1-i));
		}
	}
	//lfc add to avoid both RC4_1503 and GPIO1_AP are in output direction
	//it must be more than 20ms(refer to AP)
	delay_20ms();
	delay_20ms();
	asm("clrwdt");
	return data;	//data->2:commu with ap success,data->1:commu with ap fail	
}

void delay_800ms();
void delay_400ms();
/*
void tell_ap_fw_ver(void)
{
	static char fw_ver = 0,rc = 0;
	//read fw_ver in 0x7FE low_8_bytes
	if(nPOR)	//it's not power_up reset
		return ;
	CFGS = 0;
	PMADRH = 0x7;
	PMADRL = 0xFE;
	RD = 1;
	while(RD);
	fw_ver = PMDATL;

	rc = tx_data_to_ap(NOTIFY_FIRMWARE_UPDATE);
	if(rc != 2){
		#asm;
		RESET;
		#endasm;
	}
	delay_800ms();
	rc = tx_data_to_ap(fw_ver);
	//rc = 0x2 -> firmware_update,rc = 0x1 -> commu ok,but don't update fw,rc = 0 or 0x3,commu fail
	if(rc == 2){
		//erase 0x7FF and reset to bootloader
		GIE = 0;
		PMADRH = 0x7;
		PMADRL = 0xFF;
		FREE = 1;	//erase
		WREN = 1;
		PMCON2 = 0x55;
		PMCON2 = 0xAA;
		WR = 1;
		while(WRERR);
		while(FREE);
		delay_2ms();	//recommend delay 2ms,p97(1508 datasheet) 13 words
		WREN = 0;
		//GIE = 1;
		nPOR = 1;
		#asm;
		RESET;
		#endasm;	
	}else if(rc == 1){
		nPOR = 1;	//set nPOR 1,avoid go into it again
		return ;
	}else{
		#asm;
		RESET;
		#endasm;
	}
}
*/

void tell_ap_fw_ver(void)
{
	static char fw_ver = 0,rc = 0;
	//read fw_ver in 0x7FE low_8_bytes
	CFGS = 0;
	PMADRH = 0xF;
	PMADRL = 0xFE;
	RD = 1;
	while(RD);
	fw_ver = PMDATL;

	rc = tx_data_to_ap(NOTIFY_FIRMWARE_UPDATE);
	if(rc != 2){
		#asm;
		RESET;
		#endasm;
	}
	//delay_800ms();
	delay_400ms();
	rc = tx_data_to_ap(fw_ver);
	//rc = 0x2 -> firmware_update,rc = 0x1 -> commu ok,but don't update fw,rc = 0 or 0x3,commu fail
	if(rc == 2){
		//erase 0x7FF and reset to bootloader
		GIE = 0;
		PMADRH = 0xF;
		PMADRL = 0xFF;
		FREE = 1;	//erase
		WREN = 1;
		PMCON2 = 0x55;
		PMCON2 = 0xAA;
		WR = 1;
		while(WRERR);
		while(FREE);
		delay_20ms();
		//delay_2ms();	//recommend delay 2ms,p97(1508 datasheet) 13 words
		WREN = 0;
		//GIE = 1;
		//nPOR = 1;
		#asm;
		RESET;
		#endasm;	
	}else if(rc == 1){
		//nPOR = 1;	//set nPOR 1,avoid go into it again
		return ;
	}else{
		#asm;
		RESET;
		#endasm;
	}
}

//step 4:get batt_vol from bq247541_fuelgauger

/*************i2c master mode function begin***********/

void delay_10us();
void stop_fastchg_and_tellap(char info);
void interrupt isr(void)	//void interrupt **** is the entrance for all the interrupts
{
	static char tm0_count = 0, tm1_count = 0,rb5_first_int = 0;
	if(SSP1IF){
		SSP1IF = 0;
		i2c_int_finished = 0;
		return ;
	}
	//if want to debug timer2/1/0,must disable RA5 interrupt,otherwise unexpected sitution will cause
	if(TMR2IF){		//timer2 interrupt
		TMR2IF = 0;
		if(adapter_mcu_commu){	//adapter don't commu with mcu1503 for 212.12ms -> adapter plugged out
			//while(commu_ap_ornot);	//when commu_ap_ornot = 0,can tx_data_to_ap
			//RC3 = 1;	//pull up RC3 ASAP,stop fastchg
			RC7 = 0;	//pull down RC7,pull up RB7,stop fastchg
			RB7 = 1;
			need_to_reset = 1;
		}
		adapter_mcu_commu = 1;
		return ;
	}
	if(TMR1IF){	//tm1_count add 1,time is 65536us(0XFFFF-TMR1H:TMR1L) * prescaler(8) * (4/fosc) = 524280us
		TMR1IF = 0;
		tm1_count++;
		if(tm1_count > 10){	//tm1_count(15)->8.4s tm1_count(9):5.27s	delay_time = 0.52428 * (tm1_count + 1)
							//tm1_count(10):5.767s
			tm1_count = 0;
			commu_ap_ornot = 1;
		}
		return ;
	}
/*
	if(TMR1IF){	//tm1_count add 1,time is 65536us(0XFFFF-TMR1H:TMR1L) * prescaler(8) * (4/fosc) = 524280us
		TMR1IF = 0;
		tm1_count++;
		if(tm1_count > 9){	//tm1_count(15)->8.4s tm1_count(9):5.27s	delay_time = 0.52428 * (tm1_count + 1)
			tm1_count = 0;	
		}
	}
*/
/*
	if(TMR0IF){	//tm0_count =1 (256us*256) feed WDT:every 4ms be careful to use timer0
		TMR0IF = 0;	//timer0 interrupt produce every 65536us(if disturbed by RA5 int,tm0 int run much less)
		tm0_count++;
		if(tm0_count > 15){	//delay_time = 256us * prescaler(256) *(4/fosc) * (tm0_count + 1) physical test:tm0_count(45):3.024s
							//interrupt disturbed by RA5 int,physical test,tm0_count=3 -> 1.026ms;tm0_count=10 -> 2.76ms
							//tm0_count=12 -> 3.3ms,tm1_count=11 ->3.08ms
			tm0_count = 0;
			#asm;
			CLRWDT;
			#endasm;
		}
		return ;
	}
*/
	/*
	if(IOCAF3){	//RA3 level interrupt
		IOCAF3 = 0;
		//ap_isr_rcvd = 1;
		return ;
	}*/
	/*
	if(IOCAF1){	//RA1 level interrupt
		IOCAF1 = 0;
		ap_isr_rcvd = 1;
		return ;
	}
	*/
	if(IOCAF5){		//RA5 level interrupt
		IOCAF5 = 0;
		ap_isr_rcvd = 1;
		return ;
	}
	if(IOCBF5){	//RB5 level interrupt
		IOCBF5 = 0;
		if(!rb5_first_int){
			//enable timer2 to recognise adapter is exist?
			//if adapter don't commu with mcu1503 in 212ms -> adapter plugged out
			TMR2ON = 1;
			rb5_first_int = 1;
		}
		adapter_commu_with_mcu();	
		return ;	
	}	
}

int i2c_init()
{
	//enable MSSP interrupt
	//INTCON = 0b11000000;
	//SSP1IE = 1;
	PEIE = 1;	//lfc add later for can't trigger interrupt
	GIE = 1;

	//initial SCL/SDA I/O pin
	//RB4 SDA,RB6 SCL
	ANSB4 = 0;		//config RB4 digital I/O
	//ANSB6 = 0;		//config RB6 digital I/O
	TRISB4 = 1;		//set RB4 input
	TRISB6 = 1;		//set RB6 input
	LATB4 = 0;
	LATB6 = 0;
	CLC3CON = 0;	//forbid CLC3 on RB4/RB6
	/* pic1503 init
	//initial I/O pin
	ANSC0 = 0;	//set RC0 digital I/O
	ANSC1 = 0;	//set RC1 digital I/O
	TRISC0 = 1;	//set RC0 input
	TRISC1 = 1;	//set RC1 input
	CLC2CON = 0;
	LATC0 = 0;
	LATC1 = 0;
	PWM4CON = 0;
	NCO1SEL = 1;	//forbid RC1 NCO1 func
	CM2CON1 = 0;
	*/
	//initial hardware begin
	SSP1CON1 = 0x00;
    SSP1CON2 = 0x00;
    SSP1CON1 = 0x28;	//i2c master mode,fosc/4
	SSP1STAT = 0x80;	//disable slew rate
	//SCL CLK: 1)FOSC = 500KHz,SSP1ADD=0x09 2)FOSC=2MHz,SSP1ADD=0x27
	//SSP1ADD = 0x27;		//setup SCL clk:Fosc/((SSP1ADD+1)*4) -----> it will fault
	SSP1ADD = 0x09;			//setup SCL clk:Fosc/(4*(0x27+1))
    SSP1IF = 0;	//MSSP interrupt flag idle
	//enable weak pull up
	//nWPUEN = 0;
	//WPUB6 = 1;
	//initial hardware end
}
void i2c_start(void)
{
	SSP1IE = 1;		//SSP1IE GIE must be setted to 1 in i2c_start,i2c need to continous write/read
	PEIE = 1;	//lfc add later for can not trigger interrupt
	GIE = 1;
	SSP1IF = 0;	//it may be deleted later
	i2c_int_finished = 1;
	SEN = 1;
	while(SEN);
	while(i2c_int_finished);
}

void i2c_restart(void)
{
	i2c_int_finished = 1;
	RSEN = 1;
	while(RSEN);
	while(i2c_int_finished);
}

void i2c_stop(void)
{
	//i2c stop must wait interrupt finished,otherwise cmd_byte will not sent correctly,i2c_read will receive 0xff
	i2c_int_finished = 1;
	PEN = 1;
	while(PEN);
	while(i2c_int_finished);	//is needed
}

/*
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
*/
void delay_40us();
void i2c_write(char reg_addr)
{
	//step 1:send bq27541 i2c slave addr to bq27541	
	i2c_int_finished = 1;	//lfc add later
	SSP1BUF = BQ27541_WRITE_ADDR;	//send bq27541 slave addr to bq27541
	while(BF);
	//SSP1BUF = 0xAA;
	//R_nW = 0;	//set R_nw 1
	//ssp_idle();
	while(ACKSTAT);
	while(i2c_int_finished);	//it must be added,else reg_addr can not be sent correctly
	//value_debug1 = SSP1IF;	//just for debug,test whether PIC1503 set SSP1IF after 9th clk(set to 1 is ok)
	//interrupt_finished = 1;	//lfc add later
	SSP1BUF = reg_addr;
	while(BF);
	//while(interrupt_finished);	//lfc add later
	while(ACKSTAT);		
}

int i2c_read()		//lfc add remark:don't split i2c_start i2c_ack i2c_stop from i2c_read,maybe something wrong will happen
{
	int retval;

	i2c_int_finished = 1;
	RSEN = 1;
	while(RSEN);
	//while(SSP1IF);
	while(i2c_int_finished);
//	while(!SSP1IF);
	SSP1IF = 0;
	//while(BF);
	SSP1BUF = BQ27541_READ_ADDR;
	while(BF);
	while(R_nW);
	
	//R_nW = 1;
	while(ACKSTAT);
	
	SSP1IF = 0;
	//while(!value_debug1);	//for debug
	RCEN = 1;	//enable receive
	while(RCEN);
	while(SSP1IF);	//pic1503 will clear SSP1IF after 8th clock

	retval = SSP1BUF;
	while(BF);
	//allow_to_rx = 0;
	//first_byte = retval;
	//send ack begin
	i2c_int_finished = 1;
	ACKDT = 0;
	ACKEN = 1;
	//send ack end
	//while(!allow_to_rx);
	//value_debug1 = SSP1IF;	//just for debug
	SSP1IF = 0;	//clear SSP1IF after send ack
	while(i2c_int_finished);

//step2-2:receive data twice begin
	i2c_int_finished = 1;	//lfc add later
	RCEN = 1;
	while(RCEN);
	//value_debug1 = SSP1IF;
	while(SSP1IF);
	while(i2c_int_finished);	//lfc add later
	high_byte = SSP1BUF;
	while(BF);
	retval = (high_byte << 8) | retval;
	//just for debug begin
	//value_debug1 = BF;
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
	i2c_int_finished = 1;	//lfc add later
	PEN = 1;	//after add SP1IE = 1 GIE = 1 in i2c_start,it's OK
	while(PEN);	//if dont't set PEN=1,mcu can't release i2c,so ap can't read bq27541
	while(SSP1IF);
	while(i2c_int_finished);
//lfc add for debug end
	return retval;
}

/*************i2c master mode function end*************/

int bq27541_get(char cmd)
{
	int vol_temp_cur = 0;
	
	asm("clrwdt");
	i2c_start();
	i2c_write(cmd);
	i2c_stop();		//i2c_stop is must,otherwise i2c_read will be 0.it's different from ap
	asm("clrwdt");
	vol_temp_cur = i2c_read();
	//	i2c_stop();	//forbid to use i2c_stop after i2c_read,refer to i2c_read func
	if(cmd == BQ27541_REG_TEMP){
		vol_temp_cur = vol_temp_cur + ZERO_IN_KELVIN;
	}
	asm("clrwdt");
	return vol_temp_cur;
}

/* ADC get function begin*/
void delay_44us();

#define ADC_RC2 	0
#define ADC_RC6		1
#define ADC_NOCHAN	4
int adc_get(char adc_chan)
{
/* 1503 ADC port
	//RA0 RA1 RA2 
//step1: PORT config
	asm("clrwdt");
	TRISA0 = 1;
	ANSA0 = 1;
	TRISA1 = 1;
	ANSA1 = 1;
	TRISA2 = 1;	//set RA2 input
	ANSA2 = 1;	//set RA2 analog input
*/
	//RC2 RC6
	asm("clrwdt");
	TRISC2 = 1;	//set RC2 input
	ANSC2 = 1;	//analog I/O
	TRISC6 = 1;
	ANSC6 = 1;
//step2: ADC module config
	ADCON1 = 0xF0;	//right justify,frc osc
	if(adc_chan == ADC_RC2){	//VBUS on PCB board
		ADCON0 = 0x19;	//select ADC_CHAN AN6(RC2),turn on ADC
	}
	else if(adc_chan == ADC_RC6){	//VBAT on PCB board
		ADCON0 = 0x21;	//select ADC_CHAN AN8(RC6),turn on ADC
	}	
	else{
		FVREN = 1;	//enable fvr
		/*
		ADFVR0 = 1;	//set FVR 4x output,4.096V
		ADFVR1 = 1;
		*/
		ADFVR1 = 0;	//set FVR 1x output 1.024V
		ADFVR0 = 1;
		
		ADCON0 = 0x7D;	//set ADC CHENNEL FVR
	}
//step3: ADC interrupt config(optional) skip it
/*
	ADCIF = 0;	//adc interrupt flag
	ADIE = 1;	//enable adc intterupt
	PEIE = 1;	//enable pherial intterupt
	GIE = 1;	//enable global intterupt
*/
//step4: wait some time for adc sample
	//adc_sample_time_wait();
	delay_44us();
	GO = 1;		//ADC start
	while(GO);	//wait ADC finished
	asm("clrwdt");
	return ((ADRESH << 8) | ADRESL);
}

/*
char vbus_vbatt_detect(void)
{
	int vbus,vbatt;
	vbus = adc_get(ADC_RA2);	//get vbus vol by RA2
	vbatt = adc_get(ADC_RA0);	//get vbat on battery by ra0
	vbus = vbus - vbatt;
	if(vbus < 26)	//(vbus - vbatt) < 100mv
		return 0;	//vbus too low
	else if(vbus > 53) //(vbus - vbatt) > 200mv	250mv:74
		return 2;	//vbus too high
	else
		return 1;  //vbus is ok
}*/

char vol_compare_result(char adc_chan,int adc_value)
{
	int low_limit,high_limit;
	if(adc_chan == ADC_RC2){
		low_limit = 10;		//100mv
		high_limit = 23;	//200mv
	} else {
		low_limit = 27;	//95mv~121mv
		high_limit = 26;
	}
	if(adc_value < low_limit)	//(vbus - vbatt) < 100mv
		return 0;	//vbus too low
	else if(adc_value > high_limit) //(vbus - vbatt) > 200mv	250mv:74
		return 2;	//vbus too high
	else
		return 1;  //vbus is ok
}

char vbus_vbatt_detect(char adc_chan1,char adc_chan2)
{
	int vbus = 0;
	int vbatt = 0;
	char rc = 0;
	vbus = adc_get(adc_chan1);
	if(adc_chan2 != ADC_NOCHAN){
		vbatt = adc_get(adc_chan2);
	}
	vbus = vbus - vbatt;
	rc = vol_compare_result(adc_chan1,vbus);
	return rc;
}


/*
char vbus_vbatt_detect(char adc_chan1,char adc_chan2)
{
	int vbus,vbatt;

	vbus = adc_get(adc_chan1);
	vbatt = adc_get(adc_chan2);
	vbus = vbus - vbatt;
	if(vbus < 10)	//(vbus - vbatt) < 100mv
		return 0;	//vbus too low
	else if(vbus > 23) //(vbus - vbatt) > 200mv	250mv:74
		return 2;	//vbus too high
	else
		return 1;  //vbus is ok
}
*/
/*
char vbatt_vbatt_gnd_compare(char adc_chan1,char adc_chan2)
{
	int vol1,vol2;
	vol1 = adc_get(adc_chan1);
	vol2 = adc_get(adc_chan2);
	vol1 = vol1 - vol2;
	if(bq27541_vbatt > 4200){	//typical:4300mv
		if(vol1 > 24)
			return 1;
	} else if(bq27541_vbatt > 4000){	//typical:4100mv
		if(vol1 > 25)
			return 1;
	} else if(bq27541_vbatt > 3800){	//typical:3900mv
		if(vol1 > 26)
			return 1;
	} else if(bq27541_vbatt > 3600){
		if(vol1 > 28)
			return 1;
	} else if(bq27541_vbatt > 3400){
		if(vol1 > 30)
			return 1;
	}
	return 0;
}
*/
/* TIMER2 function begin*/
//if want to debug timer2/1/0,must disable RA5 interrupt or other ints,otherwise unexpected sitution will cause
void timer0_init(void)
{
	TMR0CS = 0;	//timer0 clk:fosc/4
	TMR0SE = 0;	//count++ on posedge
	PSA = 0;	//enable prescaler on timer0(if disturbed by RA5,enable it will result error)
	PS2 = 1;	//prescaler:1/256,timer0 overflow time:(0xFF)256 * 1us *prescaler = 65536us
	PS1 = 1;
	PS0 = 1;
	TMR0IF = 0;
	TMR0IE = 1;
	GIE = 1;
}

void timer1_init(void)	//25 words
{
	TMR1ON = 0;
	T1CON = 0x30;	//1/4fosc,prescaler->1:8,
	T1GCON = 0;	//it maybe deleted later
	TMR1H = 0;
	TMR1L = 0;
	TMR1IF = 0;	//clear timer1 interrupt flag	
	TMR1IE = 1;
	PEIE = 1;
	GIE = 1;
}

void timer1_enable(void)
{
	timer1_init();
	TMR1ON = 1;
}

void timer2_init(void)
{
	TMR2ON = 0;
	PR2 = 0xFF;	//Load period register with decimal 250,it will match with TMR2
	//T2CON = 0x01;	//postscaler->1:1,prescaler->1:4,timer2 off in init
	//T2CON = 0x00;	//postscaler->1:1,prescaler->1:1,timer2 off in init
	//T2CON = 0x7B;	//postscaler->1:16,prescaler->1:64,timer2 off in init,timer_delay:PR2 * 64 * 16 *1us = 0.26112s
	T2CON = 0x63;	//postscaler->1:13,prescaler->1:64,timer2 off in init,timer_delay:PR2 * 64 * 13 *1us = 0.21216ms
	TMR2IF = 0;	//clear TIMER2 interrupt flag
	TMR2IE = 1;	//enable timer2 interrupt
	PEIE = 1;	//enable Peripheral interrupt
	GIE = 1;
}

/*lfc add remark:
prescaler(1:1) timer2_delay_us(10us) physical test: 10us + other instructions = 19us
prescaler(1:1) timer2_delay_us(20us) physical test: 20us + other instructions = 29us
prescaler(1:1) timer2_delay_us(3us) physical test: 3us + other instruction = 12us
prescaler(1:1) other instruction : 9us

prescaler(1:4) timer2_delay_us(4us)	physical test: 4us + other instruction = 16us
prescaler(1:4) timer2_delay_us(20us) physical test: 20us + other instruction = 32us
prescaler(1:4) other instruction : 12us

test code:

	TMR2ON = 1; ---> first breakpoint
	RA2 = 1;
	void interrupt isr()
	{
		if(TMR2IF){
			RA1 = 0;
			TMR2IF = 0;	----> second breakpoint
		}
	}

void timer2_test(void)
{
	RA2 = 0;
	TRISA2 = 0;		//set RA2 output	
	LATA2 = 0;	
	ANSA2 = 0;		//set RA2 digital I/O
	timer2_init();
	TMR2ON = 1;
	RA2 = 1;	// for test
	while(1);	
}

void timer2_delay_us(char us)
{
	//1 instruction cycle = 1/(fosc/4) = 1us
	//PR2 = us/4;	// postscaler->1:1,prescaler->1:4 : TMR2 add 1,time will add 4 instruction cycle
	//PR2 = us;	//postscaler->1:1,prescaler->1:1 : TMR2 add 1,time will add 1 instruction cycle
	//us = PR2 * prescaler * postscaler * (1 instruction cycle) = 255 * 64 * 16 * 1us = 261120us		
}
*/

/*
void timer2_enable()
{
	TMR2ON = 1;		//enable timer2
}*/
/* TIMER2 function end*/


/*delay_us example begin*/
/*
code:
	RA1 = 1;  ----- begin breakpoint (1us)
	#asm;
	NOP;	(1us)
	NOP;	(1us)
	NOP;	(1us)
	#endasm
	RA1 = 0;	(1us)
	value_debug = RA1 ---- end breakpoint
	total time: 5us
*/
/*delay_us example end*/

// 1 NOP is 1us ( when fosc = 4MHz)

/* delay function begin */
void delay_10us(void)
{
// LCALL(2us) + 6 NOP(6us) + RET(2us) = 10us   physical test:10us
	#asm;
	NOP;
	NOP;
	NOP;
	NOP;
	NOP;
	NOP;
	#endasm;
}

void delay_44us(void)
{
	// LCALL(2us) + 4*10 + RET(2us) = 44us ( physical test : 44.6us)
	delay_10us();
	delay_10us();
	delay_10us();
	delay_10us();	
}

void delay_24us(void)
{
	// LCALL(2us) + 2*10 + RET(2us) = 24us ( physical test : 23us)
	delay_10us();
	delay_10us();
}

void delay_20ms(void)	//physical test:20.16ms
{
	int i;
	for(i = 0; i < 1250; i++){
		#asm;
		NOP;
		#endasm;
	}		
}

//if i is "int" type,the delay time is 2 times that i is "char" type

void delay_10ms(void)		//physical test: 10ms
{
	int i = 585;
	for(i = 0; i < 585; i++){
		#asm;
		NOP;
		#endasm;
	}
}
/*delay function end*/

/*feed wdt function begin*/
void wdt_init(void)
{
	//CONFIG1 = WDTE_NSLEEP;	// WDT enabled while running and disabled in Sleep
	//WDTCON = 0x1D;	// WDT timeout:32s,enable/disable in CONFIG1
	WDTCON = 0X16;		//WDT timeout:2s
}
/*feed wdt function end*/

void delay_800ms();
void stop_fastchg_and_tellap(char info)
{
	//if havn't started fastchg,use "RESET" instead of "tellapthenreset",because "tellapthenreset" cost 200ms at least,a lot of time
	//the commu between adapter and 1503 will corrupt
	asm("clrwdt");
	//RC3 = 1;
	RC7 = 0;
	RB7 = 1;
	//don't close RA5 interrupt and TMR2ON to avoid 1503 don't reset
	/*
	IOCAF5 = 0;
	IOCAP5 = 0;
	IOCAN5 = 0;*/
	//1503_RC5 and 1823_RC5 sometimes conflict when both in output direction,when plugged in and out usb 
	set_rc0_input();
	tx_data_to_ap(info);
	#asm;
	RESET;
	#endasm;
}

#define GET_VOLT				0x01
#define IS_VOLT_OK				0x02
#define ASK_CURRENT_LEVEL		0x03
#define FORBID_OR_ALLOW_FASTCG	0x04
#define USB_BAD_CONNECTED		0x09

//lfc add:1823 tx data -> 1503:10100010 bit7 must be 0,it has no meaning
//bit7 must be 0:solve 1823 send one more bits(9 bits) to 1503
//don't use stop_fastchg_and_tellap(...) in adapter_commu_with_mcu,because adapter_commu_with... is irq func
//stop_fastchg_and_tellap need to wait irq
void adapter_commu_with_mcu(void)
{
	static char vbus_detect = 0;	//it must be static type,else vbus_detect is 1 at first
	//but it will be changed to 0 after into apdater_commu_with_mcu next time
	int vbatt = 0;
	char rc = 0;
	//static char err_count = 0;
	if(adapter_i < 8){
			adapter_buf[adapter_i] = RC0;
			adapter_i++;
			return ;
	}
	if(adapter_i == 8){
		if((adapter_buf[0]==1) && (adapter_buf[1]==0) && (adapter_buf[2]==1)){
			//adapter_data = (adapter_buf[3]<<4)|(adapter_buf[4]<<3)|(adapter_buf[5]<<2)|(adapter_buf[6]<<1)|adapter_buf[7];
			adapter_data = (adapter_buf[3]<<3)|(adapter_buf[4]<<2)|(adapter_buf[5]<<1)|adapter_buf[6];
			//value_debug = RC0;
			//i_test++;
			adapter_i = 9;
			set_rc0_output();
		//lfc add for 1823 send one more bit to 1503(mistake)
		}else if((adapter_buf[1]==1) && (adapter_buf[2]==0) && (adapter_buf[3]==1)){
			adapter_data = (adapter_buf[4]<<3)|(adapter_buf[5]<<2)|(adapter_buf[6]<<1)|adapter_buf[7];
			//i_test++;
			adapter_i = 9;
			set_rc0_output();
			return ;
/*
		}else if((adapter_buf[2]==1) && (adapter_buf[3]==0) && (adapter_buf[4]==1) && (adapter_buf[6]==1)){
			//lfc add for RA5 int mistakely trigger twice when ask for forbid_or_allow_fastchg
			adapter_data = 0x04;
			adapter_i = 8;
			err_count++;
			if(err_count < 2)
				return ;
			err_count = 0;
			adapter_i = 9;
			set_rc0_output();	
*/	
		}else{
			//lfc:don't use stop_fastchg_and_tellap instead of "RESET" before allow_chg = 1,because if 1503 and ap commu fail,it cost 200ms at least(long long ago:the program will stop here and can't run out of interrupt isr or reset)
			//stop_fastchg_and_tellap(NOTIFY_FAST_ABSENT);
			#asm;
			RESET;
			#endasm;
		}
	}
	switch(adapter_data){
		case GET_VOLT:
			if(!mcu_i){
				//reset_before_startchg();
				//mcu_buf[0] = 1;
				//mcu_buf[1] = 0;
				//mcu_buf[2] = 1;
				mcu_buf[3] = allow_chg;
				mcu_buf[4] = 0;
				mcu_buf[5] = 0;
				mcu_buf[6] = 0;
				mcu_buf[7] = 0;
				mcu_buf[8] = 0;
				mcu_buf[9] = 0;
				if(allow_chg){
					//5-bit data,1000mv/32 = 31mv/div
					if(bq27541_vbatt > 3392){
						vbatt = (bq27541_vbatt - 3396)/16;
						mcu_buf[4] = (vbatt >> 5) & 0x1;
						mcu_buf[5] = (vbatt >> 4) & 0x1;
						mcu_buf[6] = (vbatt >> 3) & 0x1;
						mcu_buf[7] = (vbatt >> 2) & 0x1;
						mcu_buf[8] = (vbatt >> 1) & 0x1;
						mcu_buf[9] = vbatt & 0x1;
						/*	13077 need it,14001 needn't to detect battery bad connected
						rc = vbus_vbatt_detect(ADC_RA0,ADC_RA1);
						rc = rc + vbus_vbatt_detect(ADC_RC2,ADC_NOCHAN);
						if(rc > 0){
							RC3 = 1;	//stop fastchg
							bad_connect = 1;
						}
						*/
					}else{	//if vbatt < 3350 or vbatt = 0,illegal vbatt,when mcu_buf[3] is 0,adapter will stop charge
						mcu_buf[3] = 0;
						//mcu_buf[0] = 0;
						//mcu_buf[1] = 0;
						//mcu_buf[2] = 0;	
					}
					//vbatt = adc_detect_by_fvr(0);	//read RA1 vol	//8 words	
				}
			}
			RC0 = mcu_buf[mcu_i];
			mcu_i++;
			if(mcu_i > 9){
				delay_600us();	//add for the last bit
				set_rc0_input();
				mcu_i = 0;
				adapter_i = 0;
				adapter_mcu_commu = 0;
			}
			//reset_before_startchg();
			break;
		case IS_VOLT_OK:	//adjust current--level 2
			if(!mcu_i){
				//mcu_buf[0] = 1;
				//mcu_buf[1] = 0;
				//mcu_buf[2] = 1;
				//mcu_buf[3] = 0;
				mcu_buf[4] = 0;
				mcu_buf[5] = 0;
				//mcu_buf[6] = 0;
				//mcu_buf[7] = 0;
				//mcu_buf[8] = 0;
				//mcu_buf[9] = 0;
				//lfc delete just for debug,it shoule be added later
				vbus_detect = vbus_vbatt_detect(ADC_RC2,ADC_RC6);	//330 words	//RA2 - RA1
				if(vbus_detect == 2){	//vbus vol too high
					mcu_buf[4] = 1;
					mcu_buf[5] = 0;
				}else if(vbus_detect == 1){	//vbus vol is ok
					mcu_buf[4] = 1;	
					mcu_buf[5] = 1;
				}else{				//vbus vol is too low
					mcu_buf[4] = 0;
					mcu_buf[5] = 1;
				}
			}
			RC0 = mcu_buf[mcu_i];
			mcu_i++;
			if(mcu_i > 9){
				//if mcu_buf[9] is used,delay_600us is needed
				delay_600us();
				set_rc0_input();
				adapter_i = 0;
				mcu_i = 0;
				if(vbus_detect == 1){
					//RC3 = 0;	//if vbus vol is OK,pull down RC3,start fastchg
					RC7 = 1;
					RB7 = 0;
					vbus_detect = 0;	//it maybe deleted later
				}
				adapter_mcu_commu = 0;	
			}
			//reset_before_startchg();
			break;

		case ASK_CURRENT_LEVEL:
			if(!mcu_i){
				//mcu_buf[0] = 1;
				//mcu_buf[1] = 0;
				//mcu_buf[2] = 1;

				//clear mcu_buf[3][4][5][6],else 1823 mistakenly set current to max_5A
				mcu_buf[3] = 0;
				mcu_buf[4] = 0;
				mcu_buf[5] = 0;
				mcu_buf[6] = 0;
				//current = 3000mA + (buf[7] << 2 | (buf[8] << 1) | buf[9]) * 250mA
				if(battery_type){	//3000mAh,current:4.5A
					mcu_buf[7] = 1;
					mcu_buf[8] = 1;
					mcu_buf[9] = 0;
				} else {			//2700mAh,current:4A
					mcu_buf[7] = 1;
					mcu_buf[8] = 0;
					mcu_buf[9] = 0;
				}
			}
			RC0 = mcu_buf[mcu_i];
			mcu_i++;
			if(mcu_i > 9){
				//if mcu_buf[9] is used,delay_600us is needed
				delay_600us();
				set_rc0_input();
				adapter_i = 0;
				mcu_i = 0;
				adapter_mcu_commu = 0;
			}
			break;

		case FORBID_OR_ALLOW_FASTCG:
			if(!mcu_i){
				//mcu_buf[0] = 1;
				//mcu_buf[1] = 0;
				//mcu_buf[2] = 1;
				mcu_buf[3] = allow_chg;	//allow_chg is decided by AP
				mcu_buf[4] = 0;	
				//4A: circuit_res = 4 * (155 + 5 * ((mcu_buf[5] << 4)|(mcu_buf[6] << 3)|(mcu_buf[7] << 2)|(mcu_buf[8] << 1)|mcu_buf[9]))
				//3A: circuit_res = 3 * (155 + 5 *.....)
				//2A: circuit_res = 2 * (155 + 5 * ....)
				mcu_buf[5] = 1;//set to 80ohm(old 55ohm)
				mcu_buf[6] = 0;
				mcu_buf[7] = 0;
				mcu_buf[8] = 0;
				mcu_buf[9] = 0;
			}
			//mcu_buf[7] = 1;	//just for debug
			RC0 = mcu_buf[mcu_i];
			mcu_i++;
			if(mcu_i > 9){
				delay_600us();	//if mcu_buf[9] is used,delay_600us is needed
				set_rc0_input();
				adapter_request_chg = 1;
				adapter_i = 0;
				mcu_i = 0;
				adapter_mcu_commu = 0;
			}
			break;
		case USB_BAD_CONNECTED:	//usb bad connected or adapter reset after unexpect situation
			//RC3 = 1;	//stop fastchg
			RC7 = 0;
			RB7 = 1;
			bad_connect = 1;
			break;

			//don't close RA5 interrupt and TMR2ON to avoid 1503 not reset
			/*adapter_mcu_commu = 0;
			TMR2IF = 0;
			TMR2ON = 0;
			need_to_reset = 0;
			IOCAF5 = 0;
			IOCAP5 = 0;*/
			/*
			//stop_fastchg_and_tellap(NOTIFY_USB_BAD_CONNECTED);
			//if(!mcu_i){
			//mcu_buf[7]:1(known),0(unknown)
				//RC3 = 1;	//pull up RC3 to close mosfet,stop chg
				mcu_buf[0] = 1;
				mcu_buf[1] = 0;
				mcu_buf[2] = 1;
				mcu_buf[3] = 0;
				mcu_buf[4] = 0;
				mcu_buf[5] = 0;
				mcu_buf[6] = 0;
				mcu_buf[7] = 0;
				mcu_buf[8] = 0;
				mcu_buf[9] = 0;	
			//}	
			RC5 = mcu_buf[mcu_i];
			mcu_i++;
			if(mcu_i > 9){
				set_rc0_input();
				adapter_i = 0;
				mcu_i = 0;
				//allow_chg = 0;	//it cann't be written here
				//stop_fastchg_and_tellap(NOTIFY_USB_BAD_CONNECTED);
			}*
			break; */
		default:
			//stop_fastchg_and_tellap(NOTIFY_FAST_ABSENT);
			#asm;
			RESET;
			#endasm;
			break;
	}	
}

void osc_init(void)
{
	OSCCON = 0x68;	//setup FOSC = 4MHz,internal osc
	//OSCCON = 0x78;	//set up FOSC = 16MHz,internal osc	
}

void port_init(void)
{
	//config MOS SWITCH(RC7 RB7);close mosfet(pulldown RC7,pullup RB7),open mosfet(pullup RC7,pulldown RB7)
	TRISC7 = 0;	//config RC7 output
	ANSC7 = 0;	//config RC7 digital I/O
	LATC7 = 0;
	RC7 = 0;
	
	TRISB7 = 0;
	//ANSB7 = 0;
	LATB7 = 0;
	RB7 = 1;

	//config I/O commu with adapter(RB5:CLK RC0:DATA)
	//RB5:digital I/O,input,posedge interrupt trigger
	TRISB5 = 1;	//config RB5 input
	ANSB5 = 0;	//config RB5 digital I/O
	LATB5 = 0;
	IOCBF5 = 0;
	IOCIF = 0;
	IOCBP5 = 1;		//enable posedge interrupt
	IOCIE = 1;		//enable level interrupt
	GIE = 1;		//enable global interrupt

	//RC0:data with adapter(digital I/O,input)
	TRISC0 = 1;		//config RC0 input
	ANSC0 = 0;		//config RC0 digital I/O
	LATC0 = 0;
	
	//config RC4(data with ap) output digital I/O low-level
	ADCON2 = 0;
	CWG1CON0 = 0;
	CWG1CON1 = 0;
	CWG1CON2 = 0;
	CLC2CON = 0;
	CLC2POL = 0;
	RC4 = 0;
	LATC4 = 0;
	TRISC4 = 0;	//set RC4 output
	LATC4 = 0;
	//RC4 = 0;
	RC4 = 1;	//lfc modify later for reduce sleep current

	//init global variable(charge flag)
	allow_chg = 0;
	mcu_buf[0] = 1;
	mcu_buf[1] = 0;
	mcu_buf[2] = 1;
}

void RA1_int_enable(void)
{
	TRISA1 = 1;
	ANSA1 = 0;
	IOCAF1 = 0;
	IOCAP1 = 1;	//enable RA1 int init
	IOCAN1 = 0;
	IOCIE = 1;
	GIE = 1;
}

void RA3_int_enable(void)	//RA3: input,no output
{
	TRISA3 = 1;
	IOCAF3 = 0;
	IOCAP3 = 1;	//enable RA3 int init
	IOCAN3 = 0;
	IOCIE = 1;
	GIE = 1;
}

void RA5_int_enable(void)	//RA5:14001 clk with AP
{
	TRISA5 = 1;
	IOCAF5 = 0;
	IOCAP5 = 1;	//enable RA5 int
	IOCAN5 = 0;
	IOCAF5 = 0;
	IOCIE = 1;
	GIE = 1;
}

void RA4_NCO1_enable(void)
{
	TRISA4 = 0;			//set RA4 output
	ANSA4 = 0;
	NCO1SEL = 1;		//enable NCO1 on RA4
	//NCO1ACCL = 0x0;
	//NCO1ACCH = 0x0;
	//NCO1ACCU = 0x0;
	//NCO1INCH/L = 0x8000;	/61KHz
	NCO1INCL = 0xFF;
	NCO1INCH = 0xFF;
	//NCO1CON must be after NCO1INCH/L
	NCO1CLK	= 0x01;		//select FOSC
	NCO1CON = 0xC0;		//enable NOC module,enable NOC output pin,high-level effective,FDC mode
}

void pic1503_init(void)
{
	osc_init();
	port_init();
	i2c_init();
	timer2_init();
	timer1_init();
	//timer0_init();
	wdt_init();
}

void delay_107ms(void)	//physical test:107ms
{
	char i = 0;
	for(i = 0; i < 5;i++){
		delay_20ms();
	}
}

void delay_214ms(void)	//physical test:214ms
{
	char i = 0;
	for(i = 0; i < 10;i++){
		delay_20ms();
	}
}


void delay_800ms(void)	//physical test:812ms
{
	char i = 0;
	for(i = 0; i < 38;i++){
		delay_20ms();
	}
}

void delay_400ms(void)		//physical test:???
{
	char i = 0;
	for(i = 0; i < 19;i++){
		delay_20ms();
	}
}

/*
void read_write_fw_ver(void)		//60 words
{

	CFGS = 0;
	WREN = 1;
	PMADRH = 0x07;
	PMADRL = 0xFF;
	PMDATH = 0x34;
	PMDATL = 0x55;
	PMCON2 = 0X55;
	PMCON2 = 0XAA;
	WR = 1;
	while(WR);
	
	CFGS = 0;
	//PMDATH = 0;
	//PMDATL = 0;
	PMADRH = 0x07;
	PMADRL = 0xFF;
	RD = 1;	//RD must be after PMADRH/PMADRL
	#asm;
	NOP;
	NOP;
	NOP;
	#endasm;
*/
/*
	read user_id ----->it's OK
	CFGS = 1;
	PMADRH = 0x00;	//0x8000
	PMADRL = 0x00;
	PMDATH = 0x00;
	PMDATL = 0x01;
	RD = 1;		//RD must be after PMADRH/PMADRL
*/
/*	write user_id ----> it's error
	CFGS = 1;	//enable to visit user id
	//init PMADR/PMDAT
	WREN = 1;
	//LWLO = 1;
	//FREE = 0;
	PMADRH = 0x00;
	PMADRL = 0x00;
	//RD = 1;		//RD
	PMDATH = 0x66;
	PMDATL = 0x88;
	PMCON2 = 0x55;
	PMCON2 = 0xAA;
	WR = 1;
	while(WR); 

	PMADRH = 0x00;
	PMADRL = 0x00;
	RD = 1;
*/
/*	write program memory then read ---it's OK
	CFGS = 0;
	WREN = 1;
	PMADRH = 0x07;
	PMADRL = 0xFF;
	PMDATH = 0x00;
	PMDATL = 0x01;
	PMCON2 = 0X55;
	PMCON2 = 0XAA;
	WR = 1;
	while(WR);
	
	PMADRH = 0x07;
	PMADRL = 0xFF;
	RD = 1;	//RD must be after PMADRH/PMADRL
*/
	//PMDATH PMDATL is the fw_version	
//step1 : read fw_ver
/*
	CFGS = 1;
	PMADRH = 0x00;	//0x8000
	PMADRL = 0x00;
	PMDATH = 0x00;
	PMDATL = 0x01;
	RD = 1;
*/
/*
//step2: erase memory
	GIE = 0;
	PMADRH = 0x7;
	PMADRL = 0xFF;
	FREE = 1;	//erase
	WREN = 1;
	PMCON2 = 0x55;
	PMCON2 = 0xAA;
	WR = 1;
	while(WRERR);
	while(FREE);
	delay_2ms();	//recommend delay 2ms,p97(1508 datasheet) 13 words
	WREN = 0;
	GIE = 1;
//step3: write fw_ver
	PMADRH = 0x7;
	PMADRL = 0xFF;
	FREE = 0;
	WREN = 1;
	PMDATH = 0x00;
	PMDATL = 0x01;
	PMCON2 = 0x55;
	PMCON2 = 0xAA;
	WR = 1;
	while(WR);
//step4: read fw_ver for test
	PMADRH = 0x7;
	PMADRL = 0xFF;
	RD = 1;
	while(RD);

	GIE = 1;
*/
//}


void debug_func(void)
{
	//if(value_debug1 > 100)
	//	return ;
}

void fast_charging_detect(void)
{
	int vbat_temp_cur = 0;
	char rc = 0;
	char i = 0;
	char j = 0;
	
	TMR1ON = 1;	//enable timer1 to set commu_ap_ornot every 6s
fast_charging:
	i++;
	j++;
	delay_20ms();
	asm("clrwdt");
		
if(i > 55){
	bq27541_vbatt = bq27541_get(BQ27541_REG_VOLT);	//250 words	//use bq27541_get can reduce 30 words than use get_batt_vol() get_temp()...
	if(bq27541_vbatt > 4350){
		stop_fastchg_and_tellap(NOTIFY_FAST_FULL);
	}

	vbat_temp_cur = bq27541_get(BQ27541_REG_TEMP);	//60 words
	if((vbat_temp_cur < 200) || (vbat_temp_cur > 450)){
		stop_fastchg_and_tellap(NOTIFY_TEMP_OVER);
	}
	i = 0;
	asm("clrwdt");
}
	//read current every 3s	//lfc modify for battery protected but charge not stop
	if(j > 150){
		vbat_temp_cur = bq27541_get(BQ27541_REG_CURRENT);	//it need to cose 1600ms to read current correctly
		if(vbat_temp_cur < 100){
			stop_fastchg_and_tellap(NOTIFY_BAD_CONNECTED);
		}
		j = 0;
	}

	if(need_to_reset){
		if(bad_connect){
			stop_fastchg_and_tellap(NOTIFY_BAD_CONNECTED);
		}
		stop_fastchg_and_tellap(NOTIFY_FAST_ABSENT);
	}
	if(bad_connect){
		stop_fastchg_and_tellap(NOTIFY_BAD_CONNECTED);
	}
	if(commu_ap_ornot){	//173 words
		if((tx_data_to_ap(NOTIFY_ALLOW_READING_IIC)) == 0x2)
			commu_ap_ornot = 0;
		else{
			#asm;
			RESET;
			#endasm;
		}
	}
	goto fast_charging;	
}

//const int fw_exist @ 0xfff = 0x3455;
void main(void)
{
	char rc = 0;
	pic1503_init();
	//debug_func();
	asm("clrwdt");
sleep_ing:
	#asm;
	SLEEP;
	#endasm;
	if(!TMR2ON){
		#asm;
		CLRWDT;
		#endasm;
		goto sleep_ing;
	}
	asm("clrwdt");
	//SSP1IE = 1;	//enable i2c interrupt 
/*
	RA3_int_enable();
	tell_ap_fw_ver();
	while(!adapter_request_chg){
		asm("clrwdt");
		if(need_to_reset){
			#asm;
			RESET;
			#endasm;
		}
		#asm;
		NOP;
		NOP;
		#endasm;
	}
	//while(allow_chg);
	//RA1_int_enable();
	if(tx_data_to_ap(NOTIFY_FAST_PRESENT) == 2){
		bq27541_vbatt = bq27541_get(BQ27541_REG_VOLT);	//get vbatt at first
		allow_chg = 1;
	}else{
		#asm;
		RESET;
		#endasm;
	}
*/
	//RA4_NCO1_enable();
	while(!adapter_request_chg){
		asm("clrwdt");
		if(need_to_reset){
			#asm;
			RESET;
			#endasm;
		}
		#asm;
		NOP;
		NOP;
		#endasm;
	}
	RA5_int_enable();
	rc = tx_data_to_ap(NOTIFY_FAST_PRESENT);
	if(rc == 1){	//android first power on,tell fw_ver
		delay_400ms();
		tell_ap_fw_ver();
	} else if(rc == 2){	//android not first power on,needn't tell fw_ver
		#asm;
		NOP;
		#endasm;
	} else{
		#asm;
		RESET;
		#endasm;
	}
	SSP1IE = 1;
	bq27541_vbatt = bq27541_get(BQ27541_REG_VOLT);	//get vbatt at first
	allow_chg = 1;
	//enable timer2 to recognise adapter is exist?
	//if adapter don't commu with mcu1503 in 212ms -> adapter plugged out
	//TMR2ON = 1;
	//	while(!allow_chg);
	//enter fastchg mode
	while(RB7){	//wait until RB7 pulled down(start fastchg)
		asm("clrwdt");
		if(need_to_reset){
			#asm;
			RESET;
			#endasm;
		}
		#asm;
		NOP;
		NOP;
		#endasm;
	}
	fast_charging_detect();
	while(1);
}
