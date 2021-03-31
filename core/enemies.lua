enemies = {}

function enemies:new(x, y, type, arg)
    local enemy = {}

    enemy.health = 10
    enemy.dead = false
    enemy.type = type
    enemy.x = x
    enemy.y = y
    world:new(enemy, 64, 128)

    enemy.sprite = sprites.enemies.bat

    enemy.atk = 1

    function enemy:update(dt)
        -- Hurt player
        if enemies:attack(self) then
            player:damaged(self.atk)
        end
    end

    enemies:add(enemy)
end

function enemies:update(dt)
    for i, e in ipairs(self) do
        e:update(dt)
    end
end

function enemies:draw()
    for i, e in ipairs(self) do
        love.graphics.draw(e.sprite, e.x - 32, e.y - 64)
    end
end

function enemies:add(enemy)
    table.insert(self, enemy)
end

function enemies:attack(enemy)
    print(enemy.x)
    print(player.x)

    return world:collision(enemy, player)
end
