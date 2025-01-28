local black = "#000000"
local white = "#ffffff"

---@param hex_str string
local hex_to_rgb = function(hex_str)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

    local red, green, blue = string.match(hex_str, pat)

    return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

---@param fg string
---@param bg string
---@param alpha number
local function blend(fg, bg, alpha)
    local bg_rgb = hex_to_rgb(bg)
    local fg_rgb = hex_to_rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

---@param hex string
---@param amount number
---@param bg string | nil
local function darken(hex, amount, bg)
    return blend(hex, bg or black, math.abs(amount))
end

---@param hex string
---@param amount number
---@param fg string | nil
local function lighten(hex, amount, fg)
    return blend(hex, fg or white, math.abs(amount))
end

return {
    hex_to_rgb = hex_to_rgb,
    darken = darken,
    lighten = lighten,
}
