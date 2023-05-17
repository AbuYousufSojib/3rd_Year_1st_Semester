Source Code:

void main() {
     TRISC=0x00; //set portb as output
     PORTC=0x00; //Initializing PORTB C off condition
     while(1) {
             portc.f0=1;  //On Condition
             portc.f1=1;
             delay_ms(1000);  //Delay 1 sec
             portc.f0=0;   //Off conditon
             portc.f1=0;
             delay_ms(1000);  //Delay 1 sec
     }
}