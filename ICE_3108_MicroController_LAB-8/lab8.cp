#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-8/lab8.c"

sbit LCD_RS at Rb0_bit;
sbit LCD_EN at Rb1_bit;
sbit LCD_D4 at Rb2_bit;
sbit LCD_D5 at Rb3_bit;
sbit LCD_D6 at Rb4_bit;
sbit LCD_D7 at Rb5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

char i;
char txt1[]="Department of ICE, PUST, PABNA";
char txt2[]="Department of ICE, PUST, PABNA";

void main() {
 Adcon1=0x06;
 cmcon=0x07;
 LCD_init();
 LCD_cmd(_LCD_CLEAR);
 LCD_out(1,1,txt1);
 LCD_out(2,1,txt2);
 LCD_cmd(_LCD_CURSOR_OFF);
 while(1)
 {
 for(i=0;i<30;i++)
 {
 LCD_cmd(_LCD_SHIFT_RIGHT);
 delay_ms(700);
 }
 for(i=0;i<30;i++)
 {
 LCD_cmd(_LCD_SHIFT_LEFT);
 delay_ms(500);
 }
 }
}
