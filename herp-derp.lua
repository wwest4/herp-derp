--Copyright © 2016 William West <william.a.west@gmail.com>
--
--This is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this.  If not, see <http://www.gnu.org/licenses/>.
   
config   = require('config')
connect  = require('connect')
circonus = require('circonus')

function tempConvertCToF(temp)
    return (temp * 9 / 5) + 32
end

function sampleData()
    data = {}
  
    for sensor = config.sensorOne, config.sensorTwo do
        status, temp, humi, _, _ = dht.read11(sensor)

        if status == dht.OK
        then
            data['sensor' .. sensor .. '_temp_deg_c'] = temp
            data['sensor' .. sensor .. '_temp_deg_f'] = tempConvertCToF(temp)
            data['sensor' .. sensor .. '_humidity_pct'] = humi
        else
            print('skipping bad sample with status ' .. status)
        end
    end
  
    circonus.HTTPTrap(config.circonus, data)
end

function startCollection()
    tmr.unregister(0)
  
    if tmr.alarm(0, config.interval, tmr.ALARM_AUTO, sampleData)
    then 
        print('scheduled data collection')
    else
        print('error scheduling data collection')
    end
end

-- initiate wifi config & connection
connect.initiate(
    config.hostname, 
    config.essid, 
    config.password,
    startCollection
)