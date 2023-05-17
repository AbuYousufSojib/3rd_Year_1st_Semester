
_main:

;lab7.c,1 :: 		void main() {
;lab7.c,2 :: 		short duty=0;
	CLRF       main_duty_L0+0
;lab7.c,3 :: 		TRISB=0x00;
	CLRF       TRISB+0
;lab7.c,4 :: 		TRISD=0xff; //Set PortD as Input
	MOVLW      255
	MOVWF      TRISD+0
;lab7.c,5 :: 		PORTB=0x00;
	CLRF       PORTB+0
;lab7.c,6 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;lab7.c,7 :: 		portb.f1=1;
	BSF        PORTB+0, 1
;lab7.c,9 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;lab7.c,10 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;lab7.c,11 :: 		PWM1_Set_Duty(duty);
	MOVF       main_duty_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lab7.c,12 :: 		while(1)
L_main0:
;lab7.c,14 :: 		if(portd.f1==1 && duty<250)
	BTFSS      PORTD+0, 1
	GOTO       L_main4
	MOVLW      128
	BTFSC      main_duty_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      250
	SUBWF      main_duty_L0+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main19:
;lab7.c,16 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;lab7.c,17 :: 		if(portd.f1==1 && duty<250) {
	BTFSS      PORTD+0, 1
	GOTO       L_main8
	MOVLW      128
	BTFSC      main_duty_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      250
	SUBWF      main_duty_L0+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main18:
;lab7.c,18 :: 		duty=duty+10;
	MOVLW      10
	ADDWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
;lab7.c,19 :: 		PWM1_Set_Duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lab7.c,20 :: 		}
L_main8:
;lab7.c,23 :: 		}
L_main4:
;lab7.c,24 :: 		if(portd.f0==1 && duty>0)
	BTFSS      PORTD+0, 0
	GOTO       L_main11
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_duty_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
L__main17:
;lab7.c,26 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;lab7.c,27 :: 		if(portd.f0==1 && duty>0) {
	BTFSS      PORTD+0, 0
	GOTO       L_main15
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_duty_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
L__main16:
;lab7.c,28 :: 		duty=duty-10;
	MOVLW      10
	SUBWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
;lab7.c,29 :: 		PWM1_Set_Duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lab7.c,30 :: 		}
L_main15:
;lab7.c,32 :: 		}
L_main11:
;lab7.c,34 :: 		}
	GOTO       L_main0
;lab7.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
