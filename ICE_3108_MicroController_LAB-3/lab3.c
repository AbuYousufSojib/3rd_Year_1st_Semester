//Source Code:

//It's for Common anode and Hex value with dot
char array[]={0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};
void main() {
     int i=0;
     TRISB=0x00; //set portb as output
     TRISD=0xff;    //set portb as input
     PORTB=0xff;	//Initialize PORTB as off condition
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