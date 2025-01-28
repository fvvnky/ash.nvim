local palette = require("ash.palette")

local B = bit or bit32

-- djb2: https://theartincode.stanis.me/008-djb2/
local hash_str = function(str)
    local hash = 5381
    for i = 1, #str do
        hash = B.lshift(hash, 5) + hash + string.byte(str, i)
    end
    return hash
end

local function hash(v)
    local t = type(v)
    if t == "table" then
        local b = 0
        for p, u in next, v do
            b = B.bxor(b, hash_str(p .. hash(u)))
        end
        return b
    elseif t == "function" then
        return hash(v(palette))
    end
    return tostring(v)
end

return {
    hash = hash,
}
