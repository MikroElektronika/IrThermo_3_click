_systemInit:
;Click_IrThermo_3_FT90x.c,36 :: 		void systemInit()
;Click_IrThermo_3_FT90x.c,39 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
LDK.L	R0, #__IRTHERMO3_I2C_CFG+0
MOVE.L	R1, R0
LDK.L	R0, #0
CALL	_mikrobus_i2cInit+0
;Click_IrThermo_3_FT90x.c,40 :: 		mikrobus_logInit( _LOG_USBUART, 56000 );
LDK.L	R1, #56000
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_IrThermo_3_FT90x.c,42 :: 		Delay_ms( 100 );
LPM.L	R28, #3333331
NOP	
L_systemInit0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_systemInit0
JMP	$+8
	#3333331
NOP	
NOP	
;Click_IrThermo_3_FT90x.c,43 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_IrThermo_3_FT90x.c,45 :: 		void applicationInit()
;Click_IrThermo_3_FT90x.c,47 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
LDK.L	R2, #58
LDK.L	R1, #__MIKROBUS1_I2C+0
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_irthermo3_i2cDriverInit+0
;Click_IrThermo_3_FT90x.c,48 :: 		Delay_ms( 500 );
LPM.L	R28, #16666665
NOP	
L_applicationInit2:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationInit2
JMP	$+8
	#16666665
;Click_IrThermo_3_FT90x.c,49 :: 		irthermo3_init(); //irthermo initialization
CALL	_irthermo3_init+0
;Click_IrThermo_3_FT90x.c,50 :: 		irthermo3_setMode(_MODE_CONTINUOUS);
LDK.L	R0, __MODE_CONTINUOUS
CALL	_irthermo3_setMode+0
;Click_IrThermo_3_FT90x.c,52 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_IrThermo_3_FT90x.c,54 :: 		void applicationTask()
LINK	LR, #76
;Click_IrThermo_3_FT90x.c,56 :: 		char tempA[] = "AMBIENT TEMPERATURE IS: ";
ADD.L	R27, SP, #27
ADD.L	R26, R27, #49
LDK.L	R28, #?ICSapplicationTask_tempA_L0+0
CALL	___CC2DB+0
;Click_IrThermo_3_FT90x.c,57 :: 		char tempO[] = "OBJECT TEMPERATURE IS: ";
;Click_IrThermo_3_FT90x.c,61 :: 		ambijentalna = irthermo3_getAmbientTemperature();
CALL	_irthermo3_getAmbientTemperature+0
; ambijentalna start address is: 4 (R1)
MOVE.L	R1, R0
;Click_IrThermo_3_FT90x.c,62 :: 		mikrobus_logWrite(tempA,_LOG_TEXT);
ADD.L	R0, SP, #27
STI.L	SP, #0, R1
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_IrThermo_3_FT90x.c,63 :: 		FloatToStr(ambijentalna,txtDouble);
ADD.L	R0, SP, #4
MOVE.L	R1, R0
LDI.L	R0, SP, #0
; ambijentalna end address is: 4 (R1)
CALL	_FloatToStr+0
;Click_IrThermo_3_FT90x.c,64 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD.L	R0, SP, #4
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IrThermo_3_FT90x.c,66 :: 		objekta = irthermo3_getObjectTemperature();
CALL	_irthermo3_getObjectTemperature+0
; objekta start address is: 4 (R1)
MOVE.L	R1, R0
;Click_IrThermo_3_FT90x.c,67 :: 		mikrobus_logWrite(tempO,_LOG_TEXT);
ADD.L	R0, SP, #52
STI.L	SP, #0, R1
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_IrThermo_3_FT90x.c,68 :: 		FloatToStr(objekta,txtDouble);
ADD.L	R0, SP, #4
MOVE.L	R1, R0
LDI.L	R0, SP, #0
; objekta end address is: 4 (R1)
CALL	_FloatToStr+0
;Click_IrThermo_3_FT90x.c,69 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD.L	R0, SP, #4
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IrThermo_3_FT90x.c,70 :: 		Delay_ms(2000);
LPM.L	R28, #66666665
NOP	
L_applicationTask4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask4
JMP	$+8
	#66666665
;Click_IrThermo_3_FT90x.c,71 :: 		}
L_end_applicationTask:
UNLINK	LR
RETURN	
; end of _applicationTask
_main:
;Click_IrThermo_3_FT90x.c,73 :: 		void main()
LDK.L	SP, #43605
;Click_IrThermo_3_FT90x.c,75 :: 		systemInit();
CALL	_systemInit+0
;Click_IrThermo_3_FT90x.c,76 :: 		applicationInit();
CALL	_applicationInit+0
;Click_IrThermo_3_FT90x.c,78 :: 		while (1)
L_main6:
;Click_IrThermo_3_FT90x.c,80 :: 		applicationTask();
CALL	_applicationTask+0
;Click_IrThermo_3_FT90x.c,81 :: 		}
JMP	L_main6
;Click_IrThermo_3_FT90x.c,82 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
