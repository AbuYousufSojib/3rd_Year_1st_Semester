#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-11/Lab11.c"
void main() {
 TRISD=0x00;
 PORTD=0xff;
 while(1)
 {
 portd=0b00000011;
 delay_ms(500);
 portd=0b00000110;
 delay_ms(500);
 portd=0b00001100;
 delay_ms(500);
 portd=0b00001001;
 delay_ms(500);
 }
}
