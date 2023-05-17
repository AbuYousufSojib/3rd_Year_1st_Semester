Source Code:

int valADC;
char x[4];
void main() {
      UART1_Init(9600);
      ADC_Init();
      //Creat a loop
      while(1)
      {
              //Read ADC Value
              valADC=ADC_Read(0);
              inttostr(valADC,x);
              UART1_Write_Text("Analog Value= ");
              UART1_Write_Text(x);
              strcpy(x,"");
              UART1_Write(13);
              delay_ms(1000);          
      }
}