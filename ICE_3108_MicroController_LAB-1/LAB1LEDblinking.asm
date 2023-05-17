
_main:

;LAB1LEDblinking.c,1 :: 		void main() {
;LAB1LEDblinking.c,2 :: 		TRISB=0x00; //Set PORTB as output
	CLRF       TRISB+0
;LAB1LEDblinking.c,3 :: 		PORTB=0x00;   //Initialize PORTB as off condition
	CLRF       PORTB+0
;LAB1LEDblinking.c,4 :: 		while(1){
L_main0:
;LAB1LEDblinking.c,5 :: 		PORTB.F0=0xff;   //Make LED on
	BSF        PORTB+0, 0
;LAB1LEDblinking.c,6 :: 		delay_ms(1000); //Delay 1 sec
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;LAB1LEDblinking.c,7 :: 		PORTB.F0=0x00;    //Make LED off again
	BCF        PORTB+0, 0
;LAB1LEDblinking.c,8 :: 		delay_ms(1000);    //Delay
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;LAB1LEDblinking.c,9 :: 		}
	GOTO       L_main0
;LAB1LEDblinking.c,10 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
