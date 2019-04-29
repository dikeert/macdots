local rules = {}
local table = require 'table'

local function adjust_layout(cfg, screen, layout)
	local apps = require 'hs.application'
	local app = apps.frontmostApplication()

	for _, override in pairs(cfg) do
		if app:name() == override.app and screen == override.screen then
			local result = {}
			for k, v in pairs(layout) do
				if override[k] then
					result[k] = override[k]
				else
					result[k] = v
				end
			end
			return result
		end
	end

	return layout
end

rules.windows = {
	apply = function(config, override)
		if config.layout.screens == nil then
			return config.layout.default
		else
			local screen = require 'hs.screen'
			local alert = require 'hs.alert'
			
			local primary = screen.primaryScreen() 

			for key, val in pairs(config.layout.screens) do
				if val.screen == primary:name() then
					if override then
						return adjust_layout(config.layout.apps, primary:name(), val)
					else
						return val
					end
				end
			end

			alert.show('Using default layout')
			return config.default
		end
	end
}

return rules
