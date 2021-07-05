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

local module = {}

function module.idle()
    print('connection is idle')
end

function module.inProgress()
    print('connecting to ' .. module.essid .. ' as ' .. module.hostname)
end

function module.wrongPassword()
    print('password was not accepted')
end

function module.APNotFound()
    print('access point ' .. module.essid .. ' was not found')
    wifi.sta.connect()
end

function module.fail()
    print('connection to ' .. module.essid .. ' failed')
    wifi.sta.connect()
end

function module.gotIP()
    print('got address ' .. wifi.sta.getip())
end

local function registerCallbacks()
    -- register & monitor wifi events
    wifi.eventmon.register(wifi.STA_IDLE, module.idle)
    wifi.eventmon.register(wifi.STA_CONNECTING, module.inProgress)
    wifi.eventmon.register(wifi.STA_WRONGPWD, module.wrongPassword)
    wifi.eventmon.register(wifi.STA_APNOTFOUND, module.APNotFound)
    wifi.eventmon.register(wifi.STA_FAIL, module.fail)
    wifi.eventmon.register(wifi.STA_GOTIP, module.gotIP)
end

function module.initiate(hostname, essid, password)
    registerCallbacks()

    module.hostname = hostname
    module.essid = essid

    station_cfg = {
        ssid = essid,
        pwd = password,
        save = true,
        auto = true
    }

    wifi.sta.sethostname(hostname)
    wifi.sta.config(station_cfg)
end

return module
