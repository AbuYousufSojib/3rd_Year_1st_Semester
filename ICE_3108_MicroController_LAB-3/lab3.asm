
_main:

;lab3.c,2 :: 		void main() {
;lab3.c,3 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;lab3.c,4 :: 		TRISB=0x00; //set portb as output
	CLRF       TRISB+0
;lab3.c,5 :: 		TRISD=0xff;    //set portb as input
	MOVLW      255
	MOVWF      TRISD+0
;lab3.c,6 :: 		PORTB=0xff;
	MOVLW      255
	MOVWF      PORTB+0
;lab3.c,7 :: 		while(1) {
L_main0:
;lab3.c,8 :: 		portb = array[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;lab3.c,9 :: 		if (portd.f0==0)
	BTFSC      PORTD+0, 0
	GOTO       L_main2
;lab3.c,11 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;lab3.c,12 :: 		if(portd.f0==0)
	BTFSC      PORTD+0, 0
	GOTO       L_main4
;lab3.c,14 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;lab3.c,15 :: 		}
L_main4:
;lab3.c,16 :: 		}
L_main2:
;lab3.c,17 :: 		if (portd.f1==0)
	BTFSC      PORTD+0, 1
	GOTO       L_main5
;lab3.c,19 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;lab3.c,20 :: 		if(portd.f1==0)
	BTFSC      PORTD+0, 1
	GOTO       L_main7
;lab3.c,22 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;lab3.c,23 :: 		}
L_main7:
;lab3.c,24 :: 		}
L_main5:
;lab3.c,25 :: 		if(i>9 || i<0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       main_i_L0+0, 0
	SUBLW      9
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L__main11
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L__main11
	GOTO       L_main10
L__main11:
;lab3.c,26 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main10:
;lab3.c,30 :: 		}
	GOTO       L_main0
;lab3.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
