# herp-derp

wireless monitoring and feedback for a reptile tank

## Prereqs

  * ESP8266 devkit (Adafruit Huzzah)
  * a way to flash the ROM (cable, software)
  * 1 or 2 DHT11 sensors on (NodeMCU) GPIO 1+2 (Arduino 4+5)
  * NodeMCU floating point build with these modules: `cjson, dht, file, gpio, http, net, node, sntp, tmr, uart, wifi`
  * available wireless AP ESSID and password
  * a Circonus account with a defined check (you should have a URL and secret, [see instructions on HTTPTrap + JSON](http://goo.gl/jzUwqg))

## Installation

  Save all of the files onto the device and reset. 
  
  Watch your data roll into Circonus, set alerts, and take care of your 🐍.
  
  ![example circonus graph](https://raw.githubusercontent.com/wwest4/herp-derp/master/images/circ-graph.png "Example Circonus Graph")
  

## Usage


## Contributions Welcome

  * add SSL support to Circonus traps
  * add heater feedback
  * add cooler feedback
  * add fogger feedback
  * add support for other time-series sinks besides Circonus
  * add motion sensor data feed
  * add light sensor data feed
  * add lighting feedback (PWM)
  * add pressure sensor data


## License

GPLv3, see [LICENSE](../LICENSE)
