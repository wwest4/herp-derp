# herp-derp

wireless monitoring and feedback for a reptile tank

## Prereqs

  * ESP8266 devkit (e.g. Adafruit Huzzah)
  * a way to flash the ROM (cable, software) - I use Adafruit's FTDI cable and esptool
  * a way to program the kit - I use nodemcu-tool
  * 1 or 2 DHT11 sensors on (NodeMCU) GPIO 1+2 (Arduino 4+5)
  * NodeMCU release 12 floating point build with these modules: `DHT, file, GPIO, http, net, node, SJSON, SNTP, timer, UART, WiFi` and TLS/SSL support
  * available wireless AP ESSID and password
  * an metrics sink (should accept json data via PUT)

## Installation

  Save all of the files onto the device and reset.

  Watch your data roll into your metrics sink and relay as appropriate, set alerts, and take care of your 🐍.

 ![weather](https://share.circonus.com/snapshot/dashboards/70e41ee5-32dc-6286-d529-8ae5378c0f2b/seEM9O)


## Usage


## Contributions Welcome

  * ~~add SSL support to Circonus traps~~
  * add heater feedback
  * add cooler feedback
  * add fogger feedback
  * ~~add support for other time-series sinks besides Circonus~~
  * add motion sensor data feed
  * add light sensor data feed
  * add lighting feedback (PWM)
  * add pressure sensor data

## Quick ESP8266 Info

Pinout from surface opposite of chip:

```
RST A_ EN 16 14 12 13 V+ Vbat GND

TX_ RX #5 #4 #0 #2 15 3V LDO_ GND
```
(_Known Bug_ - GPIO #4 and #5 are swapped in Adafruit Huzzah Rev A chip)

Dual-Use GPIO/I2C/SPI:

* #0 - red led + boot switch, out only
* #2 - blue led + boot mode detect, out only
* #15 - pulldown, boot mode detect, out only
* #16 - wake (connect to reset)

Wiremap I used for running temp/humi sensor over twisted pair (use whatever you want):

|Color|Use|
|---|---|
|solid blue|GND|
|white/blue|3VCC|
|solid orange|DAT|


## License

GPLv3, see [LICENSE](./LICENSE)

## References
  - Docs: https://nodemcu.readthedocs.io/
  - Cloud FW Builder: https://nodemcu-build.com/

