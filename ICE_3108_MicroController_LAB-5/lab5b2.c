Source Code:

//It's a common cathode hex code
char array[]={0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
void main() {
     int i=100,k;
     int left,right,middle;
     TRISC=0x00; //Set PORTB as output
     TRISD=0x00; //Set PORTD as output
     PORTC=0x00; //Initializing PORTC as off condition
     PORTD=0x00;  //Initializing PORTD as off condition
     
     while(1)
     {
             left=i/100;
             middle=(i%100)/10;
             right=(i%100)%10;
             for(k=0;k<34;k++)
             {
                              portd.f0=1;
                              portc=array[left];
                              portd.f1=0;
                              delay_ms(10);
                              portd.f1=1;
                              portc=array[middle];
                              portd.f2=0;
                              delay_ms(10);
                              portd.f2=1;
                              portc=array[right];
                              portd.f3=0;
                              delay_ms(10);
                              portd.f3=1;
                              
             }
             i++;
             if(i>999){i=100;}
     }
}