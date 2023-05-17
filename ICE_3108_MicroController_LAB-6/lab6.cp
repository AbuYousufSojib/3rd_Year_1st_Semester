#line 1 "E:/3-1 Semester/3107-08 TD/LAB/LAB-6/lab6.c"
int valADC;
char x[4];
void main() {
 UART1_Init(9600);
 ADC_Init();

 while(1)
 {

 valADC=ADC_Read(0);
 inttostr(valADC,x);
 UART1_Write_Text("Analog Value= ");
 UART1_Write_Text(x);
 strcpy(x,"");
 UART1_Write(13);
 delay_ms(1000);

 }
}
