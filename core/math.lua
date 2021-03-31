function math.clamp(n, low, high)
    return math.min(math.max(low, n), high)
end

function math.approach(v, to, am)
    if v < to then
        return math.min(v + am, to)
    elseif v > to then
        return math.max(v - am, to)
    end
    return v
end

function math.round(x)
    return math.floor(x + 0.5)
end

function math.sign(x)
    if x < 0 then
        return -1
    elseif x > 0 then
        return 1
    end

    return 0
end
