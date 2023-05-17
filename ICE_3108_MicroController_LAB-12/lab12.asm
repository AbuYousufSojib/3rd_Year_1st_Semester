
_MSDelay:

;lab12.c,2 :: 		void MSDelay(unsigned char Time)
;lab12.c,5 :: 		for(y=0;y<Time;y++)
	CLRF       R1+0
L_MSDelay0:
	MOVF       FARG_MSDelay_Time+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_MSDelay1
;lab12.c,7 :: 		for(z=0;z<20;z++);
	CLRF       R2+0
L_MSDelay3:
	MOVLW      20
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_MSDelay4
	INCF       R2+0, 1
	GOTO       L_MSDelay3
L_MSDelay4:
;lab12.c,5 :: 		for(y=0;y<Time;y++)
	INCF       R1+0, 1
;lab12.c,8 :: 		}
	GOTO       L_MSDelay0
L_MSDelay1:
;lab12.c,9 :: 		}
L_end_MSDelay:
	RETURN
; end of _MSDelay

_main:

;lab12.c,10 :: 		void main() {
;lab12.c,11 :: 		TRISC=0x00; //set PORTC as output
	CLRF       TRISC+0
;lab12.c,12 :: 		TRISD=0x00; //set PORTD as output
	CLRF       TRISD+0
;lab12.c,13 :: 		while(1)
L_main6:
;lab12.c,15 :: 		portd=0x80;
	MOVLW      128
	MOVWF      PORTD+0
;lab12.c,16 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,17 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;lab12.c,18 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,20 :: 		portd=0x40;
	MOVLW      64
	MOVWF      PORTD+0
;lab12.c,21 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,22 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,24 :: 		portd=0x20;
	MOVLW      32
	MOVWF      PORTD+0
;lab12.c,25 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,26 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,28 :: 		portd=0x10;
	MOVLW      16
	MOVWF      PORTD+0
;lab12.c,29 :: 		portc=0xFF;
	MOVLW      255
	MOVWF      PORTC+0
;lab12.c,30 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,32 :: 		portd=0x08;
	MOVLW      8
	MOVWF      PORTD+0
;lab12.c,33 :: 		portc=0xFF;
	MOVLW      255
	MOVWF      PORTC+0
;lab12.c,34 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,36 :: 		portd=0x04;
	MOVLW      4
	MOVWF      PORTD+0
;lab12.c,37 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,38 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,40 :: 		portd=0x02;
	MOVLW      2
	MOVWF      PORTD+0
;lab12.c,41 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,42 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,44 :: 		portd=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;lab12.c,45 :: 		portc=0xC0;
	MOVLW      192
	MOVWF      PORTC+0
;lab12.c,46 :: 		MSDelay(10);
	MOVLW      10
	MOVWF      FARG_MSDelay_Time+0
	CALL       _MSDelay+0
;lab12.c,47 :: 		}
	GOTO       L_main6
;lab12.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
