#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-3/lab3.c"
char array[]={0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};
void main() {
 int i=0;
 TRISB=0x00;
 TRISD=0xff;
 PORTB=0xff;
 while(1) {
 portb = array[i];
 if (portd.f0==0)
 {
 delay_ms(200);
 if(portd.f0==0)
 {
 i++;
 }
 }
 if (portd.f1==0)
 {
 delay_ms(200);
 if(portd.f1==0)
 {
 i--;
 }
 }
 if(i>9 || i<0)
 i=0;



 }
}
