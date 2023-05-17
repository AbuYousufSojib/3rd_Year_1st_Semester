
_main:

;lab8.c,20 :: 		void main() {
;lab8.c,21 :: 		Adcon1=0x06;  //Disable Analog pin
	MOVLW      6
	MOVWF      ADCON1+0
;lab8.c,22 :: 		cmcon=0x07;   //Disable comparator
	MOVLW      7
	MOVWF      CMCON+0
;lab8.c,23 :: 		LCD_init();
	CALL       _Lcd_Init+0
;lab8.c,24 :: 		LCD_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab8.c,25 :: 		LCD_out(1,1,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab8.c,26 :: 		LCD_out(2,1,txt2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab8.c,27 :: 		LCD_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab8.c,28 :: 		while(1)
L_main0:
;lab8.c,30 :: 		for(i=0;i<30;i++)
	CLRF       _i+0
L_main2:
	MOVLW      30
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;lab8.c,32 :: 		LCD_cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab8.c,33 :: 		delay_ms(700);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      27
	MOVWF      R12+0
	MOVLW      39
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;lab8.c,30 :: 		for(i=0;i<30;i++)
	INCF       _i+0, 1
;lab8.c,34 :: 		}
	GOTO       L_main2
L_main3:
;lab8.c,35 :: 		for(i=0;i<30;i++)
	CLRF       _i+0
L_main6:
	MOVLW      30
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;lab8.c,37 :: 		LCD_cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab8.c,38 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;lab8.c,35 :: 		for(i=0;i<30;i++)
	INCF       _i+0, 1
;lab8.c,39 :: 		}
	GOTO       L_main6
L_main7:
;lab8.c,40 :: 		}
	GOTO       L_main0
;lab8.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
