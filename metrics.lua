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

function module.httpHandler(code, data)
    if (code < 0) then
        print("HTTP request failed with code " .. code)
    else
        print(code, data)
    end
end

function module.HTTPTrap(config, data)
    if(next(data) == nil)
    then
        print('refusing to send an empty data set')
    else
        json = sjson.encode(data)
        headers = 'Accept: application/json\r\n'
        print('sending ' .. json .. ' to ' .. config.metricsUrl)
        http.put(config.metricsUrl, headers, json, module.httpHandler)
    end
end

return module
