local p = require("ash.palette")

local function groups()
    return {
        DapBreakpoint = { fg = p.red },
        DapBreakpointCondition = { fg = p.yellow },
        DapBreakpointRejected = { fg = p.mauve },
        DapLogPoint = { fg = p.sky },
        DapStopped = { fg = p.maroon },
    }
end

return groups
