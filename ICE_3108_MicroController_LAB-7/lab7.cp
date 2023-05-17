#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-7/lab7.c"
void main() {
 short duty=0;
 TRISB=0x00;
 TRISD=0xff;
 PORTB=0x00;
 portb.f0=0;
 portb.f1=1;

 PWM1_Init(5000);
 PWM1_Start();
 PWM1_Set_Duty(duty);
 while(1)
 {
 if(portd.f1==1 && duty<250)
 {
 delay_ms(1000);
 if(portd.f1==1 && duty<250) {
 duty=duty+10;
 PWM1_Set_Duty(duty);
 }


 }
 if(portd.f0==1 && duty>0)
 {
 delay_ms(1000);
 if(portd.f0==1 && duty>0) {
 duty=duty-10;
 PWM1_Set_Duty(duty);
 }

 }

 }




}
