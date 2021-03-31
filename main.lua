-- This is for debugging.
if os.getenv('LOCAL_LUA_DEBUGGER_VSCODE') == '1' then
    require('lldebugger').start()
end

function love.load()
    -- init
    require('core/init')

    states.go('demo')
end

function love.update(dt)
    control:update()
    states.update(dt)
    control:flush()
end

function love.draw()
    states.draw()
end
