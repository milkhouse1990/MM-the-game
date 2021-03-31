control = {}
control.buttons = {'up', 'down', 'left', 'right', 'a', 'b', 'x', 'y'}
control.binds = {
    up = 'w',
    down = 's',
    left = 'a',
    right = 'd',
    a = 'l',
    b = 'k',
    x = 'o',
    y = 'j'
}

control.input = {}
for _, button in ipairs(control.buttons) do
    control.input[button] = {
        down = false,
        press = false
    }
end

function control:update()
    for _, button in ipairs(control.buttons) do
        local down = love.keyboard.isDown(self.binds[button])
        if down and not self.input[button].down then
            self.input[button].press = true
            self.input[button].down = true
        elseif down then
            self.input[button].press = false
        else
            self.input[button].press = false
            self.input[button].down = false
        end
    end
end

function control:flush()
    -- if not love.keyboard.isDown(self.right.bind) then
    --   self.right.down = false
    -- end
end

function control.checkPress(button)
    return control.input[button].press
end
function control.checkDown(button)
    return control.input[button].down
end
