/*
    __irthermo3_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __irthermo3_driver.h
@brief    IrThermo_3 Driver
@mainpage IrThermo_3 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   IRTHERMO3
@brief      IrThermo_3 Click Driver
@{

| Global Library Prefix | **IRTHERMO3** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **Jul 2018.**      |
| Developer             | **MikroE Team**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _IRTHERMO3_H_
#define _IRTHERMO3_H_

/** 
 * @macro T_IRTHERMO3_P
 * @brief Driver Abstract type 
 */
#define T_IRTHERMO3_P    const uint8_t*

/** @defgroup IRTHERMO3_COMPILE Compilation Config */              /** @{ */

//  #define   __IRTHERMO3_DRV_SPI__                            /**<     @macro __IRTHERMO3_DRV_SPI__  @brief SPI driver selector */
   #define   __IRTHERMO3_DRV_I2C__                            /**<     @macro __IRTHERMO3_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __IRTHERMO3_DRV_UART__                           /**<     @macro __IRTHERMO3_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup IRTHERMO3_VAR Variables */                           /** @{ */

/*EEPROM CONSTANTS*/
extern const uint16_t _IRTHERMO3_EEPROM_P_R;
extern const uint16_t _IRTHERMO3_EEPROM_P_G;
extern const uint16_t _IRTHERMO3_EEPROM_P_T;
extern const uint16_t _IRTHERMO3_EEPROM_P_O;
extern const uint16_t _IRTHERMO3_EEPROM_Aa ;
extern const uint16_t _IRTHERMO3_EEPROM_Ab ;
extern const uint16_t _IRTHERMO3_EEPROM_Ba ;
extern const uint16_t _IRTHERMO3_EEPROM_Bb ;
extern const uint16_t _IRTHERMO3_EEPROM_Ca ;
extern const uint16_t _IRTHERMO3_EEPROM_Cb ;
extern const uint16_t _IRTHERMO3_EEPROM_Da ;
extern const uint16_t _IRTHERMO3_EEPROM_Db ;
extern const uint16_t _IRTHERMO3_EEPROM_Ea ;
extern const uint16_t _IRTHERMO3_EEPROM_Eb ;
extern const uint16_t _IRTHERMO3_EEPROM_Fa ;
extern const uint16_t _IRTHERMO3_EEPROM_Fb ;
extern const uint16_t _IRTHERMO3_EEPROM_Ga ;
extern const uint16_t _IRTHERMO3_EEPROM_Ha ;
extern const uint16_t _IRTHERMO3_EEPROM_Hb ;
extern const uint16_t _IRTHERMO3_EEPROM_Gb ;
extern const uint16_t _IRTHERMO3_EEPROM_Ka ;
extern const uint16_t _IRTHERMO3_EEPROM_Kb ;

extern const uint16_t _IRTHERMO3_REG_EEPROM_CONTROL    ;
extern const uint16_t _IRTHERMO3_REG_EEPROM_I2C_ADDRESS;
extern const uint16_t _IRTHERMO3_REG_I2C_ADDRESS       ;
extern const uint16_t _IRTHERMO3_REG_CONTROL           ;
extern const uint16_t _IRTHERMO3_REG_STATUS            ;

extern const uint16_t _IRTHERMO3_REG_RAM_1;
extern const uint16_t _IRTHERMO3_REG_RAM_2;
extern const uint16_t _IRTHERMO3_REG_RAM_3;
extern const uint16_t _IRTHERMO3_REG_RAM_4;
extern const uint16_t _IRTHERMO3_REG_RAM_5;
extern const uint16_t _IRTHERMO3_REG_RAM_6;
extern const uint16_t _IRTHERMO3_REG_RAM_7;
extern const uint16_t _IRTHERMO3_REG_RAM_8;
extern const uint16_t _IRTHERMO3_REG_RAM_9;

extern const uint8_t _IRTHERMO3_MODE_SLEEP     ;
extern const uint8_t _IRTHERMO3_MODE_STEP      ;
extern const uint8_t _IRTHERMO3_MODE_CONTINUOUS;
                                                                       /** @} */
/** @defgroup IRTHERMO3_TYPES Types */                             /** @{ */



                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup IRTHERMO3_INIT Driver Initialization */              /** @{ */

#ifdef   __IRTHERMO3_DRV_SPI__
void irthermo3_spiDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P spiObj);
#endif
#ifdef   __IRTHERMO3_DRV_I2C__
void irthermo3_i2cDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P i2cObj, uint8_t slave);
#endif
#ifdef   __IRTHERMO3_DRV_UART__
void irthermo3_uartDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void irthermo3_gpioDriverInit(T_IRTHERMO3_P gpioObj);
                                                                       /** @} */
/** @defgroup IRTHERMO3_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Functions for read two bytes
 *
 * @param[in] addr    Address which will be read
 * @retval two bytes data which is read from the address
 */
int16_t irthermo_readData16(uint16_t addr);

/**
 * @brief Functions for read four bytes
 *
 * @param[in] addr    Address which will be read
 * @retval four bytes data which is read from the address
 */
int32_t irthermo_readData32(uint16_t addr);

/**
 * @brief Functions for write two bytes
 *
 * @param[in] addr    address in which the data will be written
 * @param[in] _data   Data which be written in the address
 */
void irthermo_writeData16(uint16_t addr, uint16_t _data);

/**
 * @brief Functions for initialization chip
 */
void irthermo3_init();

/**
 * @brief Functions for set mode
 *
 * @param[in] mode    Mode to be set
 */
void irthermo3_setMode(uint8_t mode);

/**
 * @brief Read Ambient Temperature
 *
 * @retval - Ambient temperature
 */
float irthermo3_getAmbientTemperature();
/**
 * @brief Read Object Temperature
 *
 * @retval - Object temperature
 */
float irthermo3_getObjectTemperature();

/**
 * @brief Function for device reset
 */
void irthermo3_deviceReset();

                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_IrThermo_3_STM.c
    @example Click_IrThermo_3_TIVA.c
    @example Click_IrThermo_3_CEC.c
    @example Click_IrThermo_3_KINETIS.c
    @example Click_IrThermo_3_MSP.c
    @example Click_IrThermo_3_PIC.c
    @example Click_IrThermo_3_PIC32.c
    @example Click_IrThermo_3_DSPIC.c
    @example Click_IrThermo_3_AVR.c
    @example Click_IrThermo_3_FT90x.c
    @example Click_IrThermo_3_STM.mbas
    @example Click_IrThermo_3_TIVA.mbas
    @example Click_IrThermo_3_CEC.mbas
    @example Click_IrThermo_3_KINETIS.mbas
    @example Click_IrThermo_3_MSP.mbas
    @example Click_IrThermo_3_PIC.mbas
    @example Click_IrThermo_3_PIC32.mbas
    @example Click_IrThermo_3_DSPIC.mbas
    @example Click_IrThermo_3_AVR.mbas
    @example Click_IrThermo_3_FT90x.mbas
    @example Click_IrThermo_3_STM.mpas
    @example Click_IrThermo_3_TIVA.mpas
    @example Click_IrThermo_3_CEC.mpas
    @example Click_IrThermo_3_KINETIS.mpas
    @example Click_IrThermo_3_MSP.mpas
    @example Click_IrThermo_3_PIC.mpas
    @example Click_IrThermo_3_PIC32.mpas
    @example Click_IrThermo_3_DSPIC.mpas
    @example Click_IrThermo_3_AVR.mpas
    @example Click_IrThermo_3_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __irthermo3_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */