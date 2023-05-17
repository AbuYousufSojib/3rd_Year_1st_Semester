#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-2/Lab2.c"

char array[]={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};
void main() {
 int i=0;
 TRISB=0x00;
 PORTB=0xff;
 while(i<10){
 PORTB=array[i];
 delay_ms(1000);
 i++;
 if(i==10)
 i=0;

 }
}
