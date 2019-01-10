_systemInit:
;Click_IrThermo_3_MSP.c,36 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_MSP.c,39 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRTHERMO3_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRTHERMO3_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_IrThermo_3_MSP.c,40 :: 		mikrobus_logInit( _MIKROBUS2, 56000 );
MOVW	R1, #56000
MOVS	R0, #1
BL	_mikrobus_logInit+0
;Click_IrThermo_3_MSP.c,42 :: 		Delay_ms( 100 );
MOVW	R7, #20349
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_IrThermo_3_MSP.c,43 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_IrThermo_3_MSP.c,45 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_MSP.c,47 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
MOVS	R2, #58
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_irthermo3_i2cDriverInit+0
;Click_IrThermo_3_MSP.c,48 :: 		Delay_ms( 500 );
MOVW	R7, #36221
MOVT	R7, #91
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;Click_IrThermo_3_MSP.c,49 :: 		irthermo3_init(); //irthermo initialization
BL	_irthermo3_init+0
;Click_IrThermo_3_MSP.c,50 :: 		irthermo3_setMode(_MODE_CONTINUOUS);
MOVS	R0, __MODE_CONTINUOUS
BL	_irthermo3_setMode+0
;Click_IrThermo_3_MSP.c,52 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_IrThermo_3_MSP.c,54 :: 		void applicationTask()
SUB	SP, SP, #84
STR	LR, [SP, #0]
;Click_IrThermo_3_MSP.c,56 :: 		char tempA[] = "AMBIENT TEMPERATURE IS: ";
ADD	R11, SP, #31
ADD	R10, R11, #49
MOVW	R12, #lo_addr(?ICSapplicationTask_tempA_L0+0)
MOVT	R12, #hi_addr(?ICSapplicationTask_tempA_L0+0)
BL	___CC2DW+0
;Click_IrThermo_3_MSP.c,57 :: 		char tempO[] = "OBJECT TEMPERATURE IS: ";
;Click_IrThermo_3_MSP.c,61 :: 		ambijentalna = irthermo3_getAmbientTemperature();
BL	_irthermo3_getAmbientTemperature+0
; ambijentalna start address is: 0 (R0)
;Click_IrThermo_3_MSP.c,62 :: 		mikrobus_logWrite(tempA,_LOG_TEXT);
ADD	R0, SP, #31
VSTR	#1, S0, [SP, #4]
MOVS	R1, #1
BL	_mikrobus_logWrite+0
VLDR	#1, S0, [SP, #4]
;Click_IrThermo_3_MSP.c,63 :: 		LongDoubleToStr(ambijentalna,txtDouble);
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
;Click_IrThermo_3_MSP.c,64 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD	R0, SP, #8
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_MSP.c,66 :: 		objekta = irthermo3_getObjectTemperature();
BL	_irthermo3_getObjectTemperature+0
; objekta start address is: 0 (R0)
;Click_IrThermo_3_MSP.c,67 :: 		mikrobus_logWrite(tempO,_LOG_TEXT);
ADD	R0, SP, #56
VSTR	#1, S0, [SP, #4]
MOVS	R1, #1
BL	_mikrobus_logWrite+0
VLDR	#1, S0, [SP, #4]
;Click_IrThermo_3_MSP.c,68 :: 		LongDoubleToStr(objekta,txtDouble);
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
;Click_IrThermo_3_MSP.c,69 :: 		mikrobus_logWrite(txtDouble,_LOG_LINE);
ADD	R0, SP, #8
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_MSP.c,70 :: 		Delay_ms(2000);
MOVW	R7, #13821
MOVT	R7, #366
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_IrThermo_3_MSP.c,71 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #84
BX	LR
; end of _applicationTask
_main:
;Click_IrThermo_3_MSP.c,73 :: 		void main()
;Click_IrThermo_3_MSP.c,75 :: 		systemInit();
BL	_systemInit+0
;Click_IrThermo_3_MSP.c,76 :: 		applicationInit();
BL	_applicationInit+0
;Click_IrThermo_3_MSP.c,78 :: 		while (1)
L_main6:
;Click_IrThermo_3_MSP.c,80 :: 		applicationTask();
BL	_applicationTask+0
;Click_IrThermo_3_MSP.c,81 :: 		}
IT	AL
BAL	L_main6
;Click_IrThermo_3_MSP.c,82 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
