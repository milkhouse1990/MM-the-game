sti = require('lib/sti/sti')

states = {}

function states.go(name)
    -- load tiled level
    path = 'assets/states/' .. name .. '.lua'
    map = sti(path, {'box2d'})

    if map.layers.enemies then
        for _, e in ipairs(map.layers.enemies.objects) do
            enemies:new(e.x, e.y, e.type, e.properties.arg)
        end
    end

    for i, w in ipairs(map.layers.solid.objects) do
        world:addSolid(w)
    end
end

function states.update(dt)
    player:update(dt)
    cam:update(dt)
    enemies:update(dt)
    weapons:update(dt)
end

function states.draw()
    cam:attach()
    --   love.graphics.push()
    -- map:draw(0, 0)
    map:drawLayer(map.layers.bg)
    player:draw()
    enemies:draw()
    weapons:draw()
    -- love.graphics.pop()
    cam:detach()
    ui:draw()
end
