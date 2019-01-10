#line 1 "D:/IrThermo3click/IrThermo3click/example/c/AVR/Click_IrThermo_3_AVR.c"
#line 1 "d:/irthermo3click/irthermo3click/example/c/avr/click_irthermo_3_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/stdint.h"




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
#line 1 "d:/irthermo3click/irthermo3click/example/c/avr/click_irthermo_3_config.h"
#line 1 "d:/irthermo3click/irthermo3click/example/c/avr/click_irthermo_3_types.h"
#line 3 "d:/irthermo3click/irthermo3click/example/c/avr/click_irthermo_3_config.h"
const uint32_t _IRTHERMO3_I2C_CFG[ 1 ] =
{
 100000
};
#line 1 "d:/irthermo3click/irthermo3click/library/__irthermo3_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/stdint.h"
#line 57 "d:/irthermo3click/irthermo3click/library/__irthermo3_driver.h"
extern const uint8_t _MODE_SLEEP;
extern const uint8_t _MODE_STEP;
extern const uint8_t _MODE_CONTINUOUS;
extern const float _EMISSIVITY_WATER;
extern const float _EMISSIVITY_STAINLESS_STEEL;
extern const float _EMISSIVITY_HUMAN_SKIN;
extern const float _EMISSIVITY_FIBERGLASS;
extern const float _EMISSIVITY_ALUMINUM_POLISHED;
extern const float _EMISSIVITY_ALUMINUM_ANODISED;
extern const float _EMISSIVITY_PLYWOOD;
#line 83 "d:/irthermo3click/irthermo3click/library/__irthermo3_driver.h"
void irthermo3_i2cDriverInit( const uint8_t*  gpioObj,  const uint8_t*  i2cObj, uint8_t slave);
#line 90 "d:/irthermo3click/irthermo3click/library/__irthermo3_driver.h"
void irthermo3_gpioDriverInit( const uint8_t*  gpioObj);



void irthermo3_init();
void irthermo3_setMode(uint8_t mode);
float irthermo3_getAmbientTemperature();
float irthermo3_getObjectTemperature();
void irthermo3_setEmissivityFactor(float newFactor);
#line 37 "D:/IrThermo3click/IrThermo3click/example/c/AVR/Click_IrThermo_3_AVR.c"
void systemInit()
{

 mikrobus_i2cInit( _MIKROBUS1, &_IRTHERMO3_I2C_CFG[0] );
 mikrobus_logInit( _MIKROBUS2, 56000 );

 Delay_ms( 100 );
}

void applicationInit()
{
 irthermo3_i2cDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_I2C, 0x3A );
 Delay_ms( 500 );
 irthermo3_init();
 irthermo3_setMode(_MODE_CONTINUOUS);

}

void applicationTask()
{
 char tempA[] = "AMBIENT TEMPERATURE IS: ";
 char tempO[] = "OBJECT TEMPERATURE IS: ";
 char txtDouble[23];
 double ambijentalna, objekta;

 ambijentalna = irthermo3_getAmbientTemperature();
 mikrobus_logWrite(tempA,_LOG_TEXT);
 FloatToStr(ambijentalna,txtDouble);
 mikrobus_logWrite(txtDouble,_LOG_LINE);

 objekta = irthermo3_getObjectTemperature();
 mikrobus_logWrite(tempO,_LOG_TEXT);
 FloatToStr(objekta,txtDouble);
 mikrobus_logWrite(txtDouble,_LOG_LINE);
 Delay_ms(2000);
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
