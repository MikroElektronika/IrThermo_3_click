/*
    __irthermo3_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__irthermo3_driver.h"
#include "__irthermo3_hal.c"

/* ------------------------------------------------------------------- MACROS */

/*EEPROM CONSTANTS*/
const uint16_t _IRTHERMO3_EEPROM_P_R = 0x240C;
const uint16_t _IRTHERMO3_EEPROM_P_G = 0x240E;
const uint16_t _IRTHERMO3_EEPROM_P_T = 0x2410;
const uint16_t _IRTHERMO3_EEPROM_P_O = 0x2412;
const uint16_t _IRTHERMO3_EEPROM_Aa  = 0x2414;
const uint16_t _IRTHERMO3_EEPROM_Ab  = 0x2416;
const uint16_t _IRTHERMO3_EEPROM_Ba  = 0x2418;
const uint16_t _IRTHERMO3_EEPROM_Bb  = 0x241A;
const uint16_t _IRTHERMO3_EEPROM_Ca  = 0x241C;
const uint16_t _IRTHERMO3_EEPROM_Cb  = 0x241E;
const uint16_t _IRTHERMO3_EEPROM_Da  = 0x2420;
const uint16_t _IRTHERMO3_EEPROM_Db  = 0x2422;
const uint16_t _IRTHERMO3_EEPROM_Ea  = 0x2424;
const uint16_t _IRTHERMO3_EEPROM_Eb  = 0x2426;
const uint16_t _IRTHERMO3_EEPROM_Fa  = 0x2428;
const uint16_t _IRTHERMO3_EEPROM_Fb  = 0x242A;
const uint16_t _IRTHERMO3_EEPROM_Ga  = 0x242C;
const uint16_t _IRTHERMO3_EEPROM_Ha  = 0x2481;
const uint16_t _IRTHERMO3_EEPROM_Hb  = 0x2482;
const uint16_t _IRTHERMO3_EEPROM_Gb  = 0x242E;
const uint16_t _IRTHERMO3_EEPROM_Ka  = 0x242F;
const uint16_t _IRTHERMO3_EEPROM_Kb  = 0x2430;

const uint16_t _IRTHERMO3_REG_EEPROM_CONTROL      = 0x24D4;
const uint16_t _IRTHERMO3_REG_EEPROM_I2C_ADDRESS  = 0x24D5;
const uint16_t _IRTHERMO3_REG_I2C_ADDRESS         = 0x3000;
const uint16_t _IRTHERMO3_REG_CONTROL             = 0x3001;
const uint16_t _IRTHERMO3_REG_STATUS              = 0x3FFF;

const uint16_t _IRTHERMO3_REG_RAM_1 = 0x4000;
const uint16_t _IRTHERMO3_REG_RAM_2 = 0x4001;
const uint16_t _IRTHERMO3_REG_RAM_3 = 0x4002;
const uint16_t _IRTHERMO3_REG_RAM_4 = 0x4003;
const uint16_t _IRTHERMO3_REG_RAM_5 = 0x4004;
const uint16_t _IRTHERMO3_REG_RAM_6 = 0x4005;
const uint16_t _IRTHERMO3_REG_RAM_7 = 0x4006;
const uint16_t _IRTHERMO3_REG_RAM_8 = 0x4007;
const uint16_t _IRTHERMO3_REG_RAM_9 = 0x4008;

const uint8_t _IRTHERMO3_MODE_SLEEP      = 0x01;
const uint8_t _IRTHERMO3_MODE_STEP       = 0x02;
const uint8_t _IRTHERMO3_MODE_CONTINUOUS = 0x03;

/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __IRTHERMO3_DRV_I2C__
static uint8_t _slaveAddress;
#endif

static float EmissivityFactor = 1;
static float P_R;
static float P_G;
static float P_T;
static float P_O;
static float Ea;
static float Eb;
static float Fa;
static float _Fb;
static float Ga;
static float Gb;
static float Ka;
static float _Ha;
static float Hb;
static float TOdut = 25.0;
static float TO0   = 25.0;
static float _TA0  = 25.0;

/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */

static void _setControlRegister();
static void _setSOCbit();
static uint16_t _getStatus();
static uint8_t _getCycle();
static void _setBrownOutBit();
static uint8_t _eepromBusy();
static void _waitForEEPROM(uint16_t timeout_ms);
static uint8_t _deviceBusy();
static void _waitForNewData(uint16_t timeout_ms);
static uint8_t _newDataAvailable();
static void _clearDataAvailable();

/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */

static uint16_t _getStatus()
{
    return irthermo_readData16(_IRTHERMO3_REG_STATUS);
}

static uint8_t _getCycle()
{
    uint8_t retValue = (_getStatus() & 0x007C) >> 2;
    return retValue;
}

static uint8_t _getMode()
{
    uint16_t mode = irthermo_readData16(_IRTHERMO3_REG_CONTROL);
    mode = (mode >> 1) & 0x0003;
    return (uint8_t)mode;
}

static void _setSOCbit()
{
    uint16_t reg = irthermo_readData16(_IRTHERMO3_REG_CONTROL);
    reg |= (1 << 3);
    irthermo_writeData16(_IRTHERMO3_REG_CONTROL, reg);
}

static void _setBrownOutBit()
{
    uint16_t reg = _getStatus();
    reg |= (1 << 8);
    irthermo_writeData16(_IRTHERMO3_REG_STATUS, reg);
}

static void _clearDataAvailable()
{
    uint16_t reg = _getStatus();
    reg &= ~(1 << 0);
    irthermo_writeData16(_IRTHERMO3_REG_STATUS, reg);
}

static void _waitForNewData(uint16_t timeout_ms)
{
    uint16_t counter = 0;
    while(!_newDataAvailable())
    {
        Delay_1ms();
        counter++;
        if(counter > timeout_ms)
        {
            return;
        }
    }
}

static uint8_t _newDataAvailable()
{
  uint8_t retValue = _getStatus() & (uint16_t)(0x0001 << 0);
  return retValue;
}

static uint8_t _deviceBusy()
{
  uint8_t retValue = (_getStatus() & (uint16_t)(0x0001 << 10));
  return retValue;
}

static uint8_t _eepromBusy(){
   uint8_t retValue = (_getStatus() & (uint16_t)(0x0001 << 9));
   return retValue;
}

static void _waitForEEPROM(uint16_t timeout_ms)
{
    uint16_t counter = 0;
    while(_eepromBusy() == 1)
    {
        Delay_1ms();
        counter++;
        if(counter > timeout_ms)
        {
            return;
        }
    }
}

/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __IRTHERMO3_DRV_SPI__

void irthermo3_spiDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __IRTHERMO3_DRV_I2C__

void irthermo3_i2cDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __IRTHERMO3_DRV_UART__

void irthermo3_uartDriverInit(T_IRTHERMO3_P gpioObj, T_IRTHERMO3_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}
#endif

/* ----------------------------------------------------------- IMPLEMENTATION */

int16_t irthermo_readData16(uint16_t addr)
{
    uint8_t writeReg[ 2 ];
    uint8_t readReg[ 2 ];
    int16_t retVal = 0;

    writeReg[ 0 ] = (addr & 0xFF00) >> 8;
    writeReg[ 1 ] = (addr & 0x00FF);

    hal_i2cStart();
    hal_i2cWrite(_slaveAddress, writeReg, 2, END_MODE_RESTART);
    hal_i2cRead(_slaveAddress, readReg, 2, END_MODE_STOP);

    retVal = readReg[ 0 ];
    retVal <<= 8;
    retVal |= readReg[ 1 ];

    return retVal;
}

int32_t irthermo_readData32(uint16_t addr)
{
    uint8_t writeReg[ 2 ];
    uint8_t readReg[ 4 ];
    int32_t retVal = 0;

    writeReg[ 0 ] = addr >> 8;
    writeReg[ 1 ] = (addr & 0x00FF);

    hal_i2cStart();
    hal_i2cWrite(_slaveAddress, writeReg, 2, END_MODE_RESTART);
    hal_i2cRead(_slaveAddress, readReg, 4, END_MODE_STOP);

    retVal = readReg[ 2 ];
    retVal <<= 8;
    retVal |= readReg[ 3 ];
    retVal <<= 8;
    retVal |= readReg[ 0 ];
    retVal <<= 8;
    retVal |= readReg[ 1 ];

    return retVal;
}

void irthermo_writeData16(uint16_t addr, uint16_t _data)
{
    uint8_t writeReg[ 4 ];

    writeReg[ 3 ] = (_data & 0xFF00) >> 8;
    writeReg[ 2 ] = (_data & 0x00FF);
    writeReg[ 0 ] = (addr & 0xFF00) >> 8;
    writeReg[ 1 ] = (addr & 0x00FF);

    hal_i2cStart();
    hal_i2cWrite(_slaveAddress, writeReg, 4, END_MODE_STOP);
}

void irthermo3_init()
{
    int32_t readData;
    int16_t readData16;
   
    _waitForEEPROM(750);
    irthermo3_setMode(0x02);
    
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_P_R);
    P_R = readData * 0.00390625;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_P_G);
    P_G = readData * 0.000000953;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_P_T);
    P_T = readData * 5.6843418860808015E-14;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_P_O);
    P_O = readData * 0.00390625;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_Ea);
    Ea = readData * 0.00001525;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_Eb);
    Eb = readData * 0.00390625;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_Fa);
    Fa = readData * 1.4210854715202004E-14;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_Fb);
    _Fb = readData * 1.4551915228366852E-11;
    readData = irthermo_readData32(_IRTHERMO3_EEPROM_Ga);
    Ga = readData * 1.4551915228366852E-11;
    readData16 = irthermo_readData16(_IRTHERMO3_EEPROM_Gb);
    Gb = readData16 * 0.0009765625;
    readData16 = irthermo_readData16(_IRTHERMO3_EEPROM_Ka);
    Ka = readData16 * 0.0009765625;
    readData16 = irthermo_readData16(_IRTHERMO3_EEPROM_Ha);
    _Ha = readData16 * 0.000061035;
    readData16 = irthermo_readData16(_IRTHERMO3_EEPROM_Hb);
    Hb = readData16 * 0.000061035;
   
    irthermo3_setMode(0x06);
}

void irthermo3_setMode(uint8_t mode)
{
    uint16_t reg  = irthermo_readData16(_IRTHERMO3_REG_CONTROL);
    reg &= ~(0x0003 << 1); //Clear the mode bits
    reg |= (mode << 1);
    irthermo_writeData16(_IRTHERMO3_REG_CONTROL, reg);
}

float irthermo3_getAmbientTemperature()
{
    int16_t RAM6;
    int16_t RAM9;

    float VRta;
    float AMB;
    float ambientTemp;

    if(_getMode() != _IRTHERMO3_MODE_CONTINUOUS)
    {
        _setSOCbit();
    }
    _clearDataAvailable();
    _waitForNewData(750);
   
    RAM6 = irthermo_readData16(_IRTHERMO3_REG_RAM_6);
    RAM9 = irthermo_readData16(_IRTHERMO3_REG_RAM_9);
  
    VRta = RAM9 + Gb * (RAM6 / 12.0);
    AMB = ((RAM6 / 12.0) / VRta) * 524288;
    ambientTemp = P_O + (AMB - P_R) / P_G + P_T * (AMB - P_R)*(AMB - P_R);
   
    return ambientTemp;
}

float irthermo3_getObjectTemperature()
{
    uint8_t cyclePosition;
    int16_t Sc1;
    int16_t Sc2;
    int16_t RAM6;
    int16_t RAM9;
   
    float VRta;
    float AMB;
    float TO;
    float TO_clc1;
    float TO_clc;
    float Ta;
    float VRto;
    float Sto;
    float TAdut;
    float TAdutK;
   
    if(_getMode() != _IRTHERMO3_MODE_CONTINUOUS)
    {
        _setSOCbit();
    }
    _clearDataAvailable();
    _waitForNewData(750);
   
    Sc1 = irthermo_readData16(_IRTHERMO3_REG_RAM_4);
    Sc1 += irthermo_readData16(_IRTHERMO3_REG_RAM_5);
    Sc1 = Sc1 / 2;
   
    Sc2 = irthermo_readData16(_IRTHERMO3_REG_RAM_7);
    Sc2 += irthermo_readData16(_IRTHERMO3_REG_RAM_8);
    Sc2 = Sc2 / 2;
   
    RAM6 = irthermo_readData16(_IRTHERMO3_REG_RAM_6);
    RAM9 = irthermo_readData16(_IRTHERMO3_REG_RAM_9);
   
    VRta = RAM9 + Gb * (RAM6 / 12.0);
    AMB = ((RAM6 / 12.0) / VRta) * 524288;
    Ta = irthermo3_getAmbientTemperature();
   
    VRto = RAM9 + Ka*(RAM6 / 12);
   
    cyclePosition = _getCycle();
   
    if(cyclePosition == 2)
    {
       Sto = (Sc2 / 12)/ VRto;
       Sto = Sto * 524288;
    }
    else
    {
       Sto = (Sc1 / 12)/ VRto;
       Sto = Sto * 524288;
    }
   
    TAdut = (AMB - Eb) / Ea + 25.0;
    TAdutK = TAdut + 273.15;

    TO_clc = EmissivityFactor * Fa;
    TO_clc1 = 1 + Ga * (Ta - TO0) + _Fb * (TAdut - _TA0);
    TO = Sto / (TO_clc * TO_clc1);
    TO = TO + (TAdutK * TAdutK * TAdutK * TAdutK);
    TO = pow( TO, 0.25);
    TO = TO - 273.14 - Hb;
   
    return TO;
}

void irthermo3_deviceReset()
{
    uint8_t writeData[ 4 ];

    writeData[ 0 ] = 0x30;
    writeData[ 1 ] = 0x05;
    writeData[ 2 ] = 0x00;
    writeData[ 3 ] = 0x06;

    hal_i2cStart();
    hal_i2cWrite(_slaveAddress , writeData, 4,END_MODE_STOP);
}

/* -------------------------------------------------------------------------- */
/*
  __irthermo3_driver.c

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