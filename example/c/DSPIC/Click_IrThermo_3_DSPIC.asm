
_systemInit:

;Click_IrThermo_3_DSPIC.c,36 :: 		void systemInit()
;Click_IrThermo_3_DSPIC.c,39 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(__IRTHERMO3_I2C_CFG), W0
	MOV	W0, W11
	CLR	W10
	CALL	_mikrobus_i2cInit
;Click_IrThermo_3_DSPIC.c,40 :: 		mikrobus_logInit( _LOG_USBUART_A, 56000 );
	MOV	#56000, W11
	MOV	#0, W12
	MOV.B	#32, W10
	CALL	_mikrobus_logInit
;Click_IrThermo_3_DSPIC.c,42 :: 		Delay_ms( 100 );
	MOV	#3, W8
	MOV	#2261, W7
L_systemInit0:
	DEC	W7
	BRA NZ	L_systemInit0
	DEC	W8
	BRA NZ	L_systemInit0
;Click_IrThermo_3_DSPIC.c,43 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_IrThermo_3_DSPIC.c,45 :: 		void applicationInit()
;Click_IrThermo_3_DSPIC.c,47 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#58, W12
	MOV	#lo_addr(__MIKROBUS1_I2C), W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_irthermo3_i2cDriverInit
;Click_IrThermo_3_DSPIC.c,48 :: 		Delay_ms( 500 );
	MOV	#11, W8
	MOV	#11309, W7
L_applicationInit2:
	DEC	W7
	BRA NZ	L_applicationInit2
	DEC	W8
	BRA NZ	L_applicationInit2
;Click_IrThermo_3_DSPIC.c,49 :: 		irthermo3_init(); //irthermo initialization
	CALL	_irthermo3_init
;Click_IrThermo_3_DSPIC.c,50 :: 		irthermo3_setMode(_MODE_CONTINUOUS);
	MOV.B	#__MODE_CONTINUOUS, W10
	CALL	_irthermo3_setMode
;Click_IrThermo_3_DSPIC.c,52 :: 		}
L_end_applicationInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:
	LNK	#72

;Click_IrThermo_3_DSPIC.c,54 :: 		void applicationTask()
;Click_IrThermo_3_DSPIC.c,56 :: 		char tempA[] = "AMBIENT TEMPERATURE IS: ";
	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #23, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICSapplicationTask_tempA_L0), W0
	REPEAT	#48
	MOV.B	[W0++], [W1++]
;Click_IrThermo_3_DSPIC.c,57 :: 		char tempO[] = "OBJECT TEMPERATURE IS: ";
;Click_IrThermo_3_DSPIC.c,61 :: 		ambijentalna = irthermo3_getAmbientTemperature();
	CALL	_irthermo3_getAmbientTemperature
; ambijentalna start address is: 4 (W2)
	MOV.D	W0, W2
;Click_IrThermo_3_DSPIC.c,62 :: 		mikrobus_logWrite(tempA,_LOG_TEXT);
	ADD	W14, #23, W0
	PUSH.D	W2
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
	POP.D	W2
;Click_IrThermo_3_DSPIC.c,63 :: 		FloatToStr(ambijentalna,txtDouble);
	ADD	W14, #0, W0
	MOV	W0, W12
	MOV.D	W2, W10
; ambijentalna end address is: 4 (W2)
	CALL	_FloatToStr
;Click_IrThermo_3_DSPIC.c,64 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
	ADD	W14, #0, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
;Click_IrThermo_3_DSPIC.c,66 :: 		objekta = irthermo3_getObjectTemperature();
	CALL	_irthermo3_getObjectTemperature
; objekta start address is: 4 (W2)
	MOV.D	W0, W2
;Click_IrThermo_3_DSPIC.c,67 :: 		mikrobus_logWrite(tempO,_LOG_TEXT);
	MOV	#48, W0
	ADD	W14, W0, W0
	PUSH.D	W2
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
	POP.D	W2
;Click_IrThermo_3_DSPIC.c,68 :: 		FloatToStr(objekta,txtDouble);
	ADD	W14, #0, W0
	MOV	W0, W12
	MOV.D	W2, W10
; objekta end address is: 4 (W2)
	CALL	_FloatToStr
;Click_IrThermo_3_DSPIC.c,69 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
	ADD	W14, #0, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
;Click_IrThermo_3_DSPIC.c,70 :: 		Delay_ms(2000);
	MOV	#41, W8
	MOV	#45239, W7
L_applicationTask4:
	DEC	W7
	BRA NZ	L_applicationTask4
	DEC	W8
	BRA NZ	L_applicationTask4
;Click_IrThermo_3_DSPIC.c,71 :: 		}
L_end_applicationTask:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_IrThermo_3_DSPIC.c,73 :: 		void main()
;Click_IrThermo_3_DSPIC.c,75 :: 		systemInit();
	CALL	_systemInit
;Click_IrThermo_3_DSPIC.c,76 :: 		applicationInit();
	CALL	_applicationInit
;Click_IrThermo_3_DSPIC.c,78 :: 		while (1)
L_main6:
;Click_IrThermo_3_DSPIC.c,80 :: 		applicationTask();
	CALL	_applicationTask
;Click_IrThermo_3_DSPIC.c,81 :: 		}
	GOTO	L_main6
;Click_IrThermo_3_DSPIC.c,82 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
