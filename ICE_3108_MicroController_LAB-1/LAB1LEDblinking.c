Source Code:

void main() {
  TRISB=0x00; //Set PORTB as output
  PORTB=0x00;   //Initialize PORTB as off condition
  while(1){
      PORTB.F0=0xff;   //Make LED on
      delay_ms(1000); //Delay 1 sec
      PORTB.F0=0x00;    //Make LED off again
      delay_ms(1000);    //Delay 1 sec
  }
}