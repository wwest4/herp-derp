-- Adapted from: https://bigdanzblog.wordpress.com/2015/04/24/esp8266-nodemcu-interrupting-init-lua-during-boot/

function abortTest()
    abort = true
    uart.on('data') -- unregister any uart.on callbacks
end

function abortInit()
    -- initailize abort boolean flag
    abort = false
    print('Press ENTER to abort startup')
    -- if <CR> is pressed, call abortTest
    uart.on('data', '\r', abortTest, 0)
    -- start timer to execute startup function in 5 seconds
    if not tmr.create():alarm(5000, tmr.ALARM_SINGLE, startup) then
        print('Failed to create startup timer')
    end
end

function startup()
    uart.on('data')
    -- if user requested abort, exit
    if abort == true then
        print('startup aborted')
        return
    end
    -- otherwise, start up
    print('in startup')
    dofile('herp-derp.lua')
end

-- call abortInit after 1s
if not tmr.create():alarm(1000, tmr.ALARM_SINGLE, abortInit) then
    print('Failed to create init timer')
end
