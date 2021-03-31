world = {}
world.solids = {}
world.eps = 2

function world:new(entity, width, height, vx, vy)
    entity.width, entity.height = width, height
    entity.vx, entity.vy = vx or 0, vy or 0
    entity.ground = false
    entity.gravity = 0.5
end

function world:addSolid(solid)
    table.insert(world.solids, solid)
end

function world:update(entity)
    -- y direction
    -- move
    entity.y = entity.y + entity.vy

    -- check whether step on something
    -- if grounded and nothing below
    if entity.ground and world:collisionNumber(entity, 0, world.eps) == 0 then
        -- if not grounded and step in something
        entity.ground = false
    elseif not entity.ground and world:collisionNumber(entity) > 0 then
        entity.y = math.floor(entity.y + world.eps + 0.5)
        while world:collisionNumber(entity) > 0 do
            entity.y = entity.y - world.eps
        end
        entity.ground = true
        entity.vy = 0
    -- else:
    -- 1) grounded and something below;
    -- 2) not grounded and not step in anything;
    -- do nothing (keep grounded state)
    end

    -- x direction
    entity.x = entity.x + entity.vx

    if world:collisionNumber(entity) > 0 then
        s = math.sign(entity.vx)
        entity.x = math.round(entity.x + s)
        while world:collisionNumber(entity) > 0 do
            entity.x = entity.x - s
        end
        entity.vx = 0
    end
end
function world:collisionNumber(e, x, y)
    local x = x or 0
    local y = y or 0
    local res = 0
    for _, solid in pairs(world.solids) do
        if world:collision(e, solid, x, y) then
            res = res + 1
        end
    end
    return res
end
function world:collision(e1, e2, x, y)
    print(e1.x)
    print(e2.x)

    local x = x or 0
    local y = y or 0
    return world:rectOverlapsRect(e1.x + x, e1.y + y, e1.width, e1.height, e2.x, e2.y, e2.width, e2.height)
end
function world:rectOverlapsRect(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end
