player = {}
player.x = 100
player.y = 500
player.image = love.graphics.newImage('sprites/milk_dress.png')

world:new(player, 64, 128)

player.hp = 100
player.hpMax = 100

player.leftSpeed = -1.3
player.rightSpeed = 1.3
player.rightDecel = 1.3
player.jumpSpeed = -5.25
player.maxRightSpeed = 13
player.maxLeftSpeed = -13
player.facing = 1
player.knockbackSpeed = -0.5
function player:update(dt)
    --apply gravity
    self.vy = self.vy + self.gravity

    if self.ground then
        -- move
        local move = self.input.move()
        if move ~= 0 then
            self.facing = move
            self.vx = self.vx + (move == -1 and self.leftSpeed or self.rightSpeed)
        else
            self.vx = math.approach(self.vx, 0, self.facing == -1 and self.leftDecel or self.rightDecel)
        end
        self.vx = math.clamp(self.vx, self.maxLeftSpeed, self.maxRightSpeed)

        -- jump
        if control.checkPress('b') then
            self.vy = self.jumpSpeed
            self.ground = false
        else
            self.vy = 0
        end
    end
    world:update(self)
    self:attemptShoot()
end

function player:draw()
    local x, y = self.x - 32, self.y - 64
    love.graphics.draw(self.image, x, y)
    --, 0, 0.25)
end

player.input = {}
function player.input.move()
    local left = control.checkDown('left')
    local right = control.checkDown('right')
    if left and not right then
        return -1
    elseif right and not left then
        return 1
    else
        return 0
    end
end

function player:damaged(enemy_atk)
    dmg = enemy_atk
    self.hp = self.hp - dmg
end

function player:attemptShoot()
    if control.checkPress('y') then
        weapons:new(self.x + 64, self.y + 64)
    end
end
