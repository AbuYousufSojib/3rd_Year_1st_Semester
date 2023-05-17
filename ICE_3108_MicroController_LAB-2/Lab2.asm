
_main:

;Lab2.c,3 :: 		void main() {
;Lab2.c,4 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Lab2.c,5 :: 		TRISB=0x00; //Initializing PORTB as output
	CLRF       TRISB+0
;Lab2.c,6 :: 		PORTB=0xff;
	MOVLW      255
	MOVWF      PORTB+0
;Lab2.c,7 :: 		while(i<10){
L_main0:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;Lab2.c,8 :: 		PORTB=array[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Lab2.c,9 :: 		delay_ms(1000);
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
;Lab2.c,10 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Lab2.c,11 :: 		if(i==10)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      10
	XORWF      main_i_L0+0, 0
L__main6:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Lab2.c,12 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main3:
;Lab2.c,14 :: 		}
	GOTO       L_main0
L_main1:
;Lab2.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
