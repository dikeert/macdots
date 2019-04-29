local apps = require 'hs.application'
local cmds = require 'cmds'

local function init()
    cmds.register('apps.launchOrFocus', function(args)
        apps.launchOrFocus(args)
    end)

		cmds.register('apps.toggle', function(args)
			front_app = apps.frontmostApplication()

			if front_app:name() == args then
				front_app:hide()
			else
				apps.launchOrFocus(args)
			end
		end)
end

return {
    init = init
}
