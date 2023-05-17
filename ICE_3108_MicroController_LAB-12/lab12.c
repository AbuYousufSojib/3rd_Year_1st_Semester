//Creating Delay function
void MSDelay(unsigned char Time)
{
     unsigned char y,z;
     for(y=0;y<Time;y++)
     {
            for(z=0;z<20;z++);
     }
}
void main() {
     TRISC=0x00; //set PORTC as output
     TRISD=0x00; //set PORTD as output
     while(1)
     {
          portd=0x80;
          portc=0xC0;
          delay_ms(1);
          MSDelay(10);
          
          portd=0x40;
          portc=0xC0;
          MSDelay(10);
          
          portd=0x20;
          portc=0xC0;
          MSDelay(10);
          
          portd=0x10;
          portc=0xFF;
          MSDelay(10);
          
          portd=0x08;
          portc=0xFF;
          MSDelay(10);
          
          portd=0x04;
          portc=0xC0;
          MSDelay(10);
          
          portd=0x02;
          portc=0xC0;
          MSDelay(10);
          
          portd=0x01;
          portc=0xC0;
          MSDelay(10);
     }
}