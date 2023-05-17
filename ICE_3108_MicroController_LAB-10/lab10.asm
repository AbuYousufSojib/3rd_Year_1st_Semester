
_rotation_0:

;lab10.c,1 :: 		void rotation_0() {
;lab10.c,3 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_00:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_021
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_021:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_01
;lab10.c,5 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;lab10.c,6 :: 		delay_us(800);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_rotation_03:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_03
	DECFSZ     R12+0, 1
	GOTO       L_rotation_03
	NOP
;lab10.c,7 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;lab10.c,8 :: 		delay_us(19200);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_rotation_04:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_04
	DECFSZ     R12+0, 1
	GOTO       L_rotation_04
	NOP
	NOP
;lab10.c,3 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10.c,9 :: 		}
	GOTO       L_rotation_00
L_rotation_01:
;lab10.c,10 :: 		}
L_end_rotation_0:
	RETURN
; end of _rotation_0

_rotation_90:

;lab10.c,11 :: 		void rotation_90() {
;lab10.c,13 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_905:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_9023
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_9023:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_906
;lab10.c,15 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;lab10.c,16 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_rotation_908:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_908
	DECFSZ     R12+0, 1
	GOTO       L_rotation_908
	NOP
;lab10.c,17 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;lab10.c,18 :: 		delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_rotation_909:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_909
	DECFSZ     R12+0, 1
	GOTO       L_rotation_909
	NOP
	NOP
;lab10.c,13 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10.c,19 :: 		}
	GOTO       L_rotation_905
L_rotation_906:
;lab10.c,20 :: 		}
L_end_rotation_90:
	RETURN
; end of _rotation_90

_rotation_180:

;lab10.c,21 :: 		void rotation_180() {
;lab10.c,23 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_18010:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_18025
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_18025:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_18011
;lab10.c,25 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;lab10.c,26 :: 		delay_us(2200);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      181
	MOVWF      R13+0
L_rotation_18013:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_18013
	DECFSZ     R12+0, 1
	GOTO       L_rotation_18013
	NOP
	NOP
;lab10.c,27 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;lab10.c,28 :: 		delay_us(17800);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_rotation_18014:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_18014
	DECFSZ     R12+0, 1
	GOTO       L_rotation_18014
	NOP
;lab10.c,23 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10.c,29 :: 		}
	GOTO       L_rotation_18010
L_rotation_18011:
;lab10.c,30 :: 		}
L_end_rotation_180:
	RETURN
; end of _rotation_180

_main:

;lab10.c,31 :: 		void main() {
;lab10.c,32 :: 		TRISB=0x00;
	CLRF       TRISB+0
;lab10.c,33 :: 		while(1)
L_main15:
;lab10.c,35 :: 		rotation_0();
	CALL       _rotation_0+0
;lab10.c,36 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;lab10.c,37 :: 		rotation_90();
	CALL       _rotation_90+0
;lab10.c,38 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;lab10.c,39 :: 		rotation_180();
	CALL       _rotation_180+0
;lab10.c,40 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;lab10.c,41 :: 		}
	GOTO       L_main15
;lab10.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
