local p = require("ash.palette")

local function groups()
    return {
        DapBreakpoint = { fg = p.crimson },
        DapBreakpointCondition = { fg = p.crimson },
        DapBreakpointRejected = { fg = p.storm },
        DapLogPoint = { fg = p.slate },
        DapStopped = { fg = p.rust },
    }
end

return groups
