ui = {}
function ui:update(dt)
end

function ui:draw()
    love.graphics.setColor(1, 0, 0)
    msg = 'HP ' .. player.hp .. '/' .. player.hpMax
    love.graphics.print(msg, 0, 0)
    love.graphics.setColor(1, 1, 1)
end
