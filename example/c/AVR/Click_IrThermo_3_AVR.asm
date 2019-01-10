
_systemInit:

;Click_IrThermo_3_AVR.c,37 :: 		void systemInit()
;Click_IrThermo_3_AVR.c,40 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R16, #lo_addr(__IRTHERMO3_I2C_CFG+0)
	LDI        R17, hi_addr(__IRTHERMO3_I2C_CFG+0)
	MOV        R3, R16
	MOV        R4, R17
	CLR        R2
	CALL       _mikrobus_i2cInit+0
;Click_IrThermo_3_AVR.c,41 :: 		mikrobus_logInit( _MIKROBUS2, 56000 );
	LDI        R27, 192
	MOV        R3, R27
	LDI        R27, 218
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_IrThermo_3_AVR.c,43 :: 		Delay_ms( 100 );
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_systemInit0:
	DEC        R16
	BRNE       L_systemInit0
	DEC        R17
	BRNE       L_systemInit0
	DEC        R18
	BRNE       L_systemInit0
;Click_IrThermo_3_AVR.c,44 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_IrThermo_3_AVR.c,46 :: 		void applicationInit()
;Click_IrThermo_3_AVR.c,48 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 58
	MOV        R6, R27
	LDI        R27, #lo_addr(__MIKROBUS1_I2C+0)
	MOV        R4, R27
	LDI        R27, hi_addr(__MIKROBUS1_I2C+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _irthermo3_i2cDriverInit+0
;Click_IrThermo_3_AVR.c,49 :: 		Delay_ms( 500 );
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_applicationInit2:
	DEC        R16
	BRNE       L_applicationInit2
	DEC        R17
	BRNE       L_applicationInit2
	DEC        R18
	BRNE       L_applicationInit2
	NOP
;Click_IrThermo_3_AVR.c,50 :: 		irthermo3_init(); //irthermo initialization
	CALL       _irthermo3_init+0
;Click_IrThermo_3_AVR.c,51 :: 		irthermo3_setMode(_MODE_CONTINUOUS);
	LDI        R27, __MODE_CONTINUOUS
	MOV        R2, R27
	CALL       _irthermo3_setMode+0
;Click_IrThermo_3_AVR.c,53 :: 		}
L_end_applicationInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SUBI       R28, 72
	SBCI       R29, 0
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Click_IrThermo_3_AVR.c,55 :: 		void applicationTask()
;Click_IrThermo_3_AVR.c,57 :: 		char tempA[] = "AMBIENT TEMPERATURE IS: ";
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R30, #lo_addr(?ICSapplicationTask_tempA_L0+0)
	LDI        R31, hi_addr(?ICSapplicationTask_tempA_L0+0)
	MOVW       R26, R28
	ADIW       R26, 23
	LDI        R24, 49
	LDI        R25, 0
	CALL       ___CC2DW+0
;Click_IrThermo_3_AVR.c,58 :: 		char tempO[] = "OBJECT TEMPERATURE IS: ";
;Click_IrThermo_3_AVR.c,62 :: 		ambijentalna = irthermo3_getAmbientTemperature();
	CALL       _irthermo3_getAmbientTemperature+0
; ambijentalna start address is: 20 (R20)
	MOVW       R20, R16
	MOVW       R22, R18
;Click_IrThermo_3_AVR.c,63 :: 		mikrobus_logWrite(tempA,_LOG_TEXT);
	MOVW       R16, R28
	SUBI       R16, 233
	SBCI       R17, 255
	PUSH       R23
	PUSH       R22
	PUSH       R21
	PUSH       R20
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
	POP        R20
	POP        R21
	POP        R22
	POP        R23
;Click_IrThermo_3_AVR.c,64 :: 		FloatToStr(ambijentalna,txtDouble);
	MOVW       R16, R28
	MOVW       R6, R16
	MOVW       R2, R20
	MOVW       R4, R22
; ambijentalna end address is: 20 (R20)
	CALL       _FloatToStr+0
;Click_IrThermo_3_AVR.c,65 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
	MOVW       R16, R28
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
;Click_IrThermo_3_AVR.c,67 :: 		objekta = irthermo3_getObjectTemperature();
	CALL       _irthermo3_getObjectTemperature+0
; objekta start address is: 20 (R20)
	MOVW       R20, R16
	MOVW       R22, R18
;Click_IrThermo_3_AVR.c,68 :: 		mikrobus_logWrite(tempO,_LOG_TEXT);
	MOVW       R16, R28
	SUBI       R16, 208
	SBCI       R17, 255
	PUSH       R23
	PUSH       R22
	PUSH       R21
	PUSH       R20
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
	POP        R20
	POP        R21
	POP        R22
	POP        R23
;Click_IrThermo_3_AVR.c,69 :: 		FloatToStr(objekta,txtDouble);
	MOVW       R16, R28
	MOVW       R6, R16
	MOVW       R2, R20
	MOVW       R4, R22
; objekta end address is: 20 (R20)
	CALL       _FloatToStr+0
;Click_IrThermo_3_AVR.c,70 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
	MOVW       R16, R28
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
;Click_IrThermo_3_AVR.c,71 :: 		Delay_ms(2000);
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_applicationTask4:
	DEC        R16
	BRNE       L_applicationTask4
	DEC        R17
	BRNE       L_applicationTask4
	DEC        R18
	BRNE       L_applicationTask4
	NOP
	NOP
	NOP
	NOP
;Click_IrThermo_3_AVR.c,72 :: 		}
L_end_applicationTask:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	SUBI       R28, 185
	SBCI       R29, 255
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_IrThermo_3_AVR.c,74 :: 		void main()
;Click_IrThermo_3_AVR.c,76 :: 		systemInit();
	CALL       _systemInit+0
;Click_IrThermo_3_AVR.c,77 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_IrThermo_3_AVR.c,79 :: 		while (1)
L_main6:
;Click_IrThermo_3_AVR.c,81 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_IrThermo_3_AVR.c,82 :: 		}
	JMP        L_main6
;Click_IrThermo_3_AVR.c,83 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
