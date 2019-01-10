_systemInit:
;Click_IrThermo_3_STM.c,34 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_STM.c,36 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRTHERMO3_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRTHERMO3_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_IrThermo_3_STM.c,37 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
MOV	R1, #115200
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_IrThermo_3_STM.c,38 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_IrThermo_3_STM.c,39 :: 		mikrobus_logWrite("--- System init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_IrThermo_3_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,40 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_IrThermo_3_STM.c,42 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_STM.c,44 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
MOVS	R2, #58
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_irthermo3_i2cDriverInit+0
;Click_IrThermo_3_STM.c,45 :: 		mikrobus_logWrite("--- Application init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_IrThermo_3_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,46 :: 		irthermo3_init();
BL	_irthermo3_init+0
;Click_IrThermo_3_STM.c,47 :: 		Delay_ms( 500 );
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;Click_IrThermo_3_STM.c,48 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_IrThermo_3_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,49 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_IrThermo_3_STM.c,51 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IrThermo_3_STM.c,53 :: 		ambientTemp = irthermo3_getAmbientTemperature();
BL	_irthermo3_getAmbientTemperature+0
MOVW	R1, #lo_addr(_ambientTemp+0)
MOVT	R1, #hi_addr(_ambientTemp+0)
STR	R0, [R1, #0]
;Click_IrThermo_3_STM.c,54 :: 		mikrobus_logWrite(" Ambient temperature : ",_LOG_TEXT);
MOVW	R0, #lo_addr(?lstr4_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_IrThermo_3_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,55 :: 		FloatToStr(ambientTemp, demoText);
MOVW	R0, #lo_addr(_ambientTemp+0)
MOVT	R0, #hi_addr(_ambientTemp+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IrThermo_3_STM.c,56 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,58 :: 		objectTemp = irthermo3_getObjectTemperature();
BL	_irthermo3_getObjectTemperature+0
MOVW	R1, #lo_addr(_objectTemp+0)
MOVT	R1, #hi_addr(_objectTemp+0)
STR	R0, [R1, #0]
;Click_IrThermo_3_STM.c,59 :: 		mikrobus_logWrite(" Object temperature :",_LOG_TEXT);
MOVW	R0, #lo_addr(?lstr5_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_IrThermo_3_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,60 :: 		FloatToStr(objectTemp, demoText);
MOVW	R0, #lo_addr(_objectTemp+0)
MOVT	R0, #hi_addr(_objectTemp+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IrThermo_3_STM.c,61 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,63 :: 		mikrobus_logWrite(" ",_LOG_LINE);
MOVW	R0, #lo_addr(?lstr6_Click_IrThermo_3_STM+0)
MOVT	R0, #hi_addr(?lstr6_Click_IrThermo_3_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IrThermo_3_STM.c,64 :: 		Delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_IrThermo_3_STM.c,65 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_IrThermo_3_STM.c,67 :: 		void main()
;Click_IrThermo_3_STM.c,69 :: 		systemInit();
BL	_systemInit+0
;Click_IrThermo_3_STM.c,70 :: 		applicationInit();
BL	_applicationInit+0
;Click_IrThermo_3_STM.c,72 :: 		while (1)
L_main6:
;Click_IrThermo_3_STM.c,74 :: 		applicationTask();
BL	_applicationTask+0
;Click_IrThermo_3_STM.c,75 :: 		}
IT	AL
BAL	L_main6
;Click_IrThermo_3_STM.c,76 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
