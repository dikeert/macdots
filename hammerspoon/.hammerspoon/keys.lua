local keys = require 'hs.hotkey'
local apps = require 'hs.application'

local cmds = require 'cmds'

function init(config)
    for _, val in ipairs(config) do
        local cfg = val
        keys.bind(cfg.shortcut.modifiers, cfg.shortcut.key, function()
            cmds.invoke(val.cmd, val.args)
        end)
    end
end

return {
    init = init
}
