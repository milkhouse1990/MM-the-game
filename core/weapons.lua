weapons = {}

function weapons:new(x, y)
    local weapon = {}
    weapon.sprite = sprites.weapons.buster
    weapon.x, weapon.y = x, y
    world:new(weapon, 32, 32, 10, 0)
    weapons:add(weapon)
end

function weapons:add(weapon)
    table.insert(weapons, weapon)
end

function weapons:update()
    for _, weapon in ipairs(weapons) do
        world:update(weapon)
        for i, enemy in ipairs(enemies) do
            if world:collision(weapon, enemy) then
                table.remove(enemies, i)
            end
        end
    end
end

function weapons:draw()
    for _, weapon in ipairs(weapons) do
        love.graphics.draw(weapon.sprite, weapon.x, weapon.y)
    end
end
