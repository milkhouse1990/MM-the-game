gameWidth = 1280
gameHeight = 720
camera = require('lib/hump/camera')
local cam = camera(player.x, player.y)

function cam:update(dt)
    local lookX = player.x
    local lookY = player.y

    local level = {
        room = {
            x = 0,
            y = 0,
            width = 2048,
            height = 768
        }
    }
    local leftBound = level.room.x + gameWidth / 2
    local rightBound = level.room.x + level.room.width - gameWidth / 2
    lookX = math.min(math.max(lookX, leftBound), rightBound)

    local upperBound = level.room.y + gameHeight / 2
    local lowerBound = level.room.y + level.room.height - gameHeight / 2
    lookY = math.min(math.max(lookY, upperBound), lowerBound)

    cam:lookAt(lookX, lookY)
end
return cam
