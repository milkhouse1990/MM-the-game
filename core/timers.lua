timers = {}
function timers.new(default)
    return {
        current = 0,
        max = default
    }
end

function timers.set(timer, max)
    timer.current = max or timer.max
end

function timers.update(timer)
    timer.current = math.approach(timer.current, 0, 1)
end

function timers.up(timer)
    return timer.current == 0
end
