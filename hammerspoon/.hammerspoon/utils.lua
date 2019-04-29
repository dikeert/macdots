local cmds = require 'cmds'

local rc = hs.loadSpoon('ReloadConfiguration')
local em = hs.loadSpoon('Emojis')

local function init()
	rc:bindHotkeys({reloadConfiguration = {{'cmd', 'alt', 'ctrl'}, 'r'}})
	em:bindHotkeys({toggle = {{'cmd', 'alt', 'ctrl'}, 'e'}})
end

return {
    init = init
}
