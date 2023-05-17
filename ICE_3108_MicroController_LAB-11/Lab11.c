void main() {
    TRISD=0x00; //set PORTD as output
    PORTD=0xff; //Initializing PORTD as zero condition
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