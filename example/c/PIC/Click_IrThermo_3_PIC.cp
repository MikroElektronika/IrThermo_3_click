#line 1 "D:/Clicks_git/I/IrThermo_3_Click/SW/example/c/PIC/Click_IrThermo_3_PIC.c"
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/pic/click_irthermo_3_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/pic/click_irthermo_3_config.h"
#line 1 "d:/clicks_git/i/irthermo_3_click/sw/example/c/pic/click_irthermo_3_types.h"
#line 3 "d:/clicks_git/i/irthermo_3_click/sw/example/c/pic/click_irthermo_3_config.h"
const uint32_t _IRTHERMO3_I2C_CFG[ 1 ] =
{
 100000
};
#line 28 "D:/Clicks_git/I/IrThermo_3_Click/SW/example/c/PIC/Click_IrThermo_3_PIC.c"
char demoText[23];
float ambientTemp;
float objectTemp;

void systemInit()
{
 mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
 mikrobus_logInit( _LOG_USBUART, 115200 );
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
