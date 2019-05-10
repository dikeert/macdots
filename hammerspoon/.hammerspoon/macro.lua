local events = require "hs.eventtap"
local cmds = require "cmds"

local function init()
    cmds.register("macro.seq", function(args)
        for _, v in pairs(args) do
            events.keyStroke(v.modifiers, v.key, 0)
        end
    end)
end

return {
    init = function()
        init()
    end
}