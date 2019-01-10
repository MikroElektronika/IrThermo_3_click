#line 1 "D:/Clicks_git/I/IrThermo_3_Click/SW/example/c/ARM/STM/Click_IrThermo_3_STM.c"
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/arm/stm/click_irthermo_3_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/arm/stm/click_irthermo_3_config.h"
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/arm/stm/click_irthermo_3_types.h"
#line 3 "d:/clicks_git/i/irthermo_3_click/sw/example/c/arm/stm/click_irthermo_3_config.h"
const uint32_t _IRTHERMO3_I2C_CFG[ 1 ] =
{
 100000
};
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 58 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
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

extern const uint16_t _IRTHERMO3_REG_EEPROM_CONTROL ;
extern const uint16_t _IRTHERMO3_REG_EEPROM_I2C_ADDRESS;
extern const uint16_t _IRTHERMO3_REG_I2C_ADDRESS ;
extern const uint16_t _IRTHERMO3_REG_CONTROL ;
extern const uint16_t _IRTHERMO3_REG_STATUS ;

extern const uint16_t _IRTHERMO3_REG_RAM_1;
extern const uint16_t _IRTHERMO3_REG_RAM_2;
extern const uint16_t _IRTHERMO3_REG_RAM_3;
extern const uint16_t _IRTHERMO3_REG_RAM_4;
extern const uint16_t _IRTHERMO3_REG_RAM_5;
extern const uint16_t _IRTHERMO3_REG_RAM_6;
extern const uint16_t _IRTHERMO3_REG_RAM_7;
extern const uint16_t _IRTHERMO3_REG_RAM_8;
extern const uint16_t _IRTHERMO3_REG_RAM_9;

extern const uint8_t _IRTHERMO3_MODE_SLEEP ;
extern const uint8_t _IRTHERMO3_MODE_STEP ;
extern const uint8_t _IRTHERMO3_MODE_CONTINUOUS;
#line 116 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo3_i2cDriverInit( const uint8_t*  gpioObj,  const uint8_t*  i2cObj, uint8_t slave);
#line 123 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo3_gpioDriverInit( const uint8_t*  gpioObj);
#line 133 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
int16_t irthermo_readData16(uint16_t addr);
#line 141 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
int32_t irthermo_readData32(uint16_t addr);
#line 149 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo_writeData16(uint16_t addr, uint16_t _data);
#line 154 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo3_init();
#line 161 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo3_setMode(uint8_t mode);
#line 168 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
float irthermo3_getAmbientTemperature();
#line 174 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
float irthermo3_getObjectTemperature();
#line 179 "d:/clicks_git/i/irthermo_3_click/sw/library/__irthermo3_driver.h"
void irthermo3_deviceReset();
#line 30 "D:/Clicks_git/I/IrThermo_3_Click/SW/example/c/ARM/STM/Click_IrThermo_3_STM.c"
char demoText[23];
float ambientTemp;
float objectTemp;

void systemInit()
{
 mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
 mikrobus_logInit( _LOG_USBUART_A, 115200 );
 Delay_ms( 100 );
 mikrobus_logWrite("--- System init ---", _LOG_LINE);
}

void applicationInit()
{
 irthermo3_i2cDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_I2C, 0x3A );
 mikrobus_logWrite("--- Application init ---", _LOG_LINE);
 irthermo3_init();
 Delay_ms( 500 );
 mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
}

void applicationTask()
{
 ambientTemp = irthermo3_getAmbientTemperature();
 mikrobus_logWrite(" Ambient temperature : ",_LOG_TEXT);
 FloatToStr(ambientTemp, demoText);
 mikrobus_logWrite(demoText,_LOG_LINE);

 objectTemp = irthermo3_getObjectTemperature();
 mikrobus_logWrite(" Object temperature :",_LOG_TEXT);
 FloatToStr(objectTemp, demoText);
 mikrobus_logWrite(demoText, _LOG_LINE);

 mikrobus_logWrite(" ",_LOG_LINE);
 Delay_ms(400);
}

void main()
{
 systemInit();
 applicationInit();

 while (1)
 {
 applicationTask();
 }
}
