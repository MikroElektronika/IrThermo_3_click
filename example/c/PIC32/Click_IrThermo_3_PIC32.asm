_systemInit:
;Click_IrThermo_3_PIC32.c,33 :: 		void systemInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_IrThermo_3_PIC32.c,35 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(__IRTHERMO3_I2C_CFG+0)
ORI	R2, R2, lo_addr(__IRTHERMO3_I2C_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_i2cInit+0
NOP	
;Click_IrThermo_3_PIC32.c,36 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
LUI	R26, 1
ORI	R26, R26, 49664
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_IrThermo_3_PIC32.c,37 :: 		Delay_ms( 100 );
LUI	R24, 40
ORI	R24, R24, 45226
L_systemInit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_systemInit0
NOP	
;Click_IrThermo_3_PIC32.c,38 :: 		mikrobus_logWrite("--- System init ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,39 :: 		}
L_end_systemInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_IrThermo_3_PIC32.c,41 :: 		void applicationInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_IrThermo_3_PIC32.c,43 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 58
LUI	R26, hi_addr(__MIKROBUS1_I2C+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_I2C+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_irthermo3_i2cDriverInit+0
NOP	
;Click_IrThermo_3_PIC32.c,44 :: 		mikrobus_logWrite("--- Application init ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr2_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,45 :: 		irthermo3_init();
JAL	_irthermo3_init+0
NOP	
;Click_IrThermo_3_PIC32.c,46 :: 		Delay_ms( 500 );
LUI	R24, 203
ORI	R24, R24, 29524
L_applicationInit2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationInit2
NOP	
NOP	
NOP	
;Click_IrThermo_3_PIC32.c,47 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr3_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,48 :: 		}
L_end_applicationInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_IrThermo_3_PIC32.c,50 :: 		void applicationTask()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_IrThermo_3_PIC32.c,52 :: 		ambientTemp = irthermo3_getAmbientTemperature();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_irthermo3_getAmbientTemperature+0
NOP	
SW	R2, Offset(_ambientTemp+0)(GP)
;Click_IrThermo_3_PIC32.c,53 :: 		mikrobus_logWrite(" Ambient temperature : ",_LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr4_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr4_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,54 :: 		FloatToStr(ambientTemp, demoText);
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
LW	R25, Offset(_ambientTemp+0)(GP)
JAL	_FloatToStr+0
NOP	
;Click_IrThermo_3_PIC32.c,55 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,57 :: 		objectTemp = irthermo3_getObjectTemperature();
JAL	_irthermo3_getObjectTemperature+0
NOP	
SW	R2, Offset(_objectTemp+0)(GP)
;Click_IrThermo_3_PIC32.c,58 :: 		mikrobus_logWrite(" Object temperature :",_LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr5_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr5_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,59 :: 		FloatToStr(objectTemp, demoText);
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
LW	R25, Offset(_objectTemp+0)(GP)
JAL	_FloatToStr+0
NOP	
;Click_IrThermo_3_PIC32.c,60 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,62 :: 		mikrobus_logWrite(" ",_LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr6_Click_IrThermo_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr6_Click_IrThermo_3_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IrThermo_3_PIC32.c,63 :: 		Delay_ms(400);
LUI	R24, 162
ORI	R24, R24, 49834
L_applicationTask4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask4
NOP	
;Click_IrThermo_3_PIC32.c,64 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_IrThermo_3_PIC32.c,66 :: 		void main()
;Click_IrThermo_3_PIC32.c,68 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_IrThermo_3_PIC32.c,69 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_IrThermo_3_PIC32.c,71 :: 		while (1)
L_main6:
;Click_IrThermo_3_PIC32.c,73 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_IrThermo_3_PIC32.c,74 :: 		}
J	L_main6
NOP	
;Click_IrThermo_3_PIC32.c,75 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
