_systemInit:
;Click_IrThermo_3_CEC.c,37 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_CEC.c,40 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRTHERMO3_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRTHERMO3_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_IrThermo_3_CEC.c,41 :: 		mikrobus_logInit( _MIKROBUS2, 56000 );
MOVW	R1, #56000
MOVS	R0, #1
BL	_mikrobus_logInit+0
;Click_IrThermo_3_CEC.c,43 :: 		Delay_ms( 100 );
MOVW	R7, #27134
MOVT	R7, #24
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_IrThermo_3_CEC.c,44 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_IrThermo_3_CEC.c,46 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_CEC.c,48 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
MOVS	R2, #58
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_irthermo3_i2cDriverInit+0
;Click_IrThermo_3_CEC.c,49 :: 		Delay_ms( 500 );
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;Click_IrThermo_3_CEC.c,50 :: 		irthermo3_init(); //irthermo initialization
BL	_irthermo3_init+0
;Click_IrThermo_3_CEC.c,51 :: 		irthermo3_setMode(_MODE_CONTINUOUS);
MOVS	R0, __MODE_CONTINUOUS
BL	_irthermo3_setMode+0
;Click_IrThermo_3_CEC.c,53 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_IrThermo_3_CEC.c,55 :: 		void applicationTask()
SUB	SP, SP, #84
STR	LR, [SP, #0]
;Click_IrThermo_3_CEC.c,57 :: 		char tempA[] = "AMBIENT TEMPERATURE IS: ";
ADD	R11, SP, #31
ADD	R10, R11, #49
MOVW	R12, #lo_addr(?ICSapplicationTask_tempA_L0+0)
MOVT	R12, #hi_addr(?ICSapplicationTask_tempA_L0+0)
BL	___CC2DW+0
;Click_IrThermo_3_CEC.c,58 :: 		char tempO[] = "OBJECT TEMPERATURE IS: ";
;Click_IrThermo_3_CEC.c,62 :: 		ambijentalna = irthermo3_getAmbientTemperature();
BL	_irthermo3_getAmbientTemperature+0
; ambijentalna start address is: 0 (R0)
;Click_IrThermo_3_CEC.c,63 :: 		mikrobus_logWrite(tempA,_LOG_TEXT);
ADD	R0, SP, #31
VSTR	#1, S0, [SP, #4]
MOVS	R1, #1
BL	_mikrobus_logWrite+0
VLDR	#1, S0, [SP, #4]
;Click_IrThermo_3_CEC.c,64 :: 		LongDoubleToStr(ambijentalna,txtDouble);
ADD	R0, SP, #8
STR	R0, [SP, #80]
VMOV	R0, S0
BL	__FloatToLongDouble+0
; ambijentalna end address is: 0 (R0)
LDR	R2, [SP, #80]
VMOV	S0, R0
VMOV	S1, R1
MOV	R0, R2
BL	_LongDoubleToStr+0
;Click_IrThermo_3_CEC.c,65 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD	R0, SP, #8
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_CEC.c,67 :: 		objekta = irthermo3_getObjectTemperature();
BL	_irthermo3_getObjectTemperature+0
; objekta start address is: 0 (R0)
;Click_IrThermo_3_CEC.c,68 :: 		mikrobus_logWrite(tempO,_LOG_TEXT);
ADD	R0, SP, #56
VSTR	#1, S0, [SP, #4]
MOVS	R1, #1
BL	_mikrobus_logWrite+0
VLDR	#1, S0, [SP, #4]
;Click_IrThermo_3_CEC.c,69 :: 		LongDoubleToStr(objekta,txtDouble);
ADD	R0, SP, #8
STR	R0, [SP, #80]
VMOV	R0, S0
BL	__FloatToLongDouble+0
; objekta end address is: 0 (R0)
LDR	R2, [SP, #80]
VMOV	S0, R0
VMOV	S1, R1
MOV	R0, R2
BL	_LongDoubleToStr+0
;Click_IrThermo_3_CEC.c,70 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD	R0, SP, #8
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_CEC.c,71 :: 		Delay_ms(2000);
MOVW	R7, #18430
MOVT	R7, #488
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_IrThermo_3_CEC.c,72 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #84
BX	LR
; end of _applicationTask
_main:
;Click_IrThermo_3_CEC.c,74 :: 		void main()
;Click_IrThermo_3_CEC.c,76 :: 		systemInit();
BL	_systemInit+0
;Click_IrThermo_3_CEC.c,77 :: 		applicationInit();
BL	_applicationInit+0
;Click_IrThermo_3_CEC.c,79 :: 		while (1)
L_main6:
;Click_IrThermo_3_CEC.c,81 :: 		applicationTask();
BL	_applicationTask+0
;Click_IrThermo_3_CEC.c,82 :: 		}
IT	AL
BAL	L_main6
;Click_IrThermo_3_CEC.c,83 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
