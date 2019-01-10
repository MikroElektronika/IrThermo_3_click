![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# IrThermo3 Click

- **CIC Prefix**  : IRTHERMO3
- **Author**      : MikroE Team
- **Verison**     : 1.0.0
- **Date**        : jul 2018.

---

### Software Support

We provide a library for the IrThermo3 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2504/irthermo-3-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library performs IR and temperature measurement. 
The sensor measures the temperature of the detected object (body) and measures the ambient temperature.
For more details, see the documentation.

Key functions :

- ``` void irthermo3_init() ``` - Function for initialization chip 
- ``` float irthermo3_getAmbientTemperature() ``` - Function for read Ambient temperature
- ``` float irthermo3_getObjectTemperature() ``` - Function for read Object temperature

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes I2C module
- Application Initialization - Driver init and chip initialization
- Application Task - Reads the ambient temperature and temperature of the object every 400ms.


```.c
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
    Delay_ms(1000);
}
```


The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2504/irthermo-3-click) page.

Other mikroE Libraries used in the example:

- I2C
- Conversions

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
