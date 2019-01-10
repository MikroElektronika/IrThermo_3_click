
_systemInit:

;Click_IrThermo_3_PIC.c,34 :: 		void systemInit()
;Click_IrThermo_3_PIC.c,36 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
	CLRF        FARG_mikrobus_i2cInit_bus+0 
	MOVLW       __IRTHERMO3_I2C_CFG+0
	MOVWF       FARG_mikrobus_i2cInit_cfg+0 
	MOVLW       hi_addr(__IRTHERMO3_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+1 
	MOVLW       higher_addr(__IRTHERMO3_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+2 
	CALL        _mikrobus_i2cInit+0, 0
;Click_IrThermo_3_PIC.c,37 :: 		mikrobus_logInit( _LOG_USBUART, 115200 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       194
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_IrThermo_3_PIC.c,38 :: 		Delay_ms( 100 );
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_systemInit0:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit0
	DECFSZ      R12, 1, 1
	BRA         L_systemInit0
	DECFSZ      R11, 1, 1
	BRA         L_systemInit0
	NOP
;Click_IrThermo_3_PIC.c,39 :: 		mikrobus_logWrite("--- System init ---", _LOG_LINE);
	MOVLW       ?lstr1_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,40 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_IrThermo_3_PIC.c,42 :: 		void applicationInit()
;Click_IrThermo_3_PIC.c,44 :: 		irthermo3_i2cDriverInit( (T_IRTHERMO3_P)&_MIKROBUS1_GPIO, (T_IRTHERMO3_P)&_MIKROBUS1_I2C, 0x3A );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_irthermo3_i2cDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_irthermo3_i2cDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_irthermo3_i2cDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_I2C+0
	MOVWF       FARG_irthermo3_i2cDriverInit_i2cObj+0 
	MOVLW       hi_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_irthermo3_i2cDriverInit_i2cObj+1 
	MOVLW       higher_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_irthermo3_i2cDriverInit_i2cObj+2 
	MOVLW       58
	MOVWF       FARG_irthermo3_i2cDriverInit_slave+0 
	CALL        _irthermo3_i2cDriverInit+0, 0
;Click_IrThermo_3_PIC.c,45 :: 		mikrobus_logWrite("--- Application init ---", _LOG_LINE);
	MOVLW       ?lstr2_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,46 :: 		irthermo3_init();
	CALL        _irthermo3_init+0, 0
;Click_IrThermo_3_PIC.c,47 :: 		Delay_ms( 500 );
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_applicationInit1:
	DECFSZ      R13, 1, 1
	BRA         L_applicationInit1
	DECFSZ      R12, 1, 1
	BRA         L_applicationInit1
	DECFSZ      R11, 1, 1
	BRA         L_applicationInit1
;Click_IrThermo_3_PIC.c,48 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
	MOVLW       ?lstr3_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,49 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_IrThermo_3_PIC.c,51 :: 		void applicationTask()
;Click_IrThermo_3_PIC.c,53 :: 		ambientTemp = irthermo3_getAmbientTemperature();
	CALL        _irthermo3_getAmbientTemperature+0, 0
	MOVF        R0, 0 
	MOVWF       _ambientTemp+0 
	MOVF        R1, 0 
	MOVWF       _ambientTemp+1 
	MOVF        R2, 0 
	MOVWF       _ambientTemp+2 
	MOVF        R3, 0 
	MOVWF       _ambientTemp+3 
;Click_IrThermo_3_PIC.c,54 :: 		mikrobus_logWrite(" Ambient temperature : ",_LOG_TEXT);
	MOVLW       ?lstr4_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr4_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,55 :: 		FloatToStr(ambientTemp, demoText);
	MOVF        _ambientTemp+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _ambientTemp+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _ambientTemp+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _ambientTemp+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _demoText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_IrThermo_3_PIC.c,56 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,58 :: 		objectTemp = irthermo3_getObjectTemperature();
	CALL        _irthermo3_getObjectTemperature+0, 0
	MOVF        R0, 0 
	MOVWF       _objectTemp+0 
	MOVF        R1, 0 
	MOVWF       _objectTemp+1 
	MOVF        R2, 0 
	MOVWF       _objectTemp+2 
	MOVF        R3, 0 
	MOVWF       _objectTemp+3 
;Click_IrThermo_3_PIC.c,59 :: 		mikrobus_logWrite(" Object temperature :",_LOG_TEXT);
	MOVLW       ?lstr5_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr5_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,60 :: 		FloatToStr(objectTemp, demoText);
	MOVF        _objectTemp+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _objectTemp+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _objectTemp+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _objectTemp+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _demoText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_IrThermo_3_PIC.c,61 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,63 :: 		mikrobus_logWrite(" ",_LOG_LINE);
	MOVLW       ?lstr6_Click_IrThermo_3_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr6_Click_IrThermo_3_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IrThermo_3_PIC.c,64 :: 		Delay_ms(400);
	MOVLW       33
	MOVWF       R11, 0
	MOVLW       120
	MOVWF       R12, 0
	MOVLW       152
	MOVWF       R13, 0
L_applicationTask2:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask2
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask2
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask2
	NOP
;Click_IrThermo_3_PIC.c,65 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_IrThermo_3_PIC.c,67 :: 		void main()
;Click_IrThermo_3_PIC.c,69 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_IrThermo_3_PIC.c,70 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_IrThermo_3_PIC.c,72 :: 		while (1)
L_main3:
;Click_IrThermo_3_PIC.c,74 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_IrThermo_3_PIC.c,75 :: 		}
	GOTO        L_main3
;Click_IrThermo_3_PIC.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
