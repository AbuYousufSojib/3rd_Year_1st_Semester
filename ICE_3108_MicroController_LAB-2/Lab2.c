Source Code:

//It's for Common anode and Hex value with dot 
char array[]={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};
void main() {
      int i=0;
    TRISB=0x00; //Initializing PORTB as output
    PORTB=0xff; //Initialize PORTB as off condition
    while(i<10){
             PORTB=array[i];
             delay_ms(1000); //Delay 1 sec
             i++;
             if(i==10)
                    i=0; //Start again from the beggining
    
    }
}