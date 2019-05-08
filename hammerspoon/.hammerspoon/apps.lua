local apps = require "hs.application"
local cmds = require "cmds"

local function do_toggle(app_name)
    front_app = apps.frontmostApplication()

    if front_app:name() == app_name then
        front_app:hide()
    else
        apps.launchOrFocus(app_name)
    end
end

local function init()
    cmds.register(
        "apps.launchOrFocus",
        function(args)
            apps.launchOrFocus(args)
        end
    )

    cmds.register(
        "apps.toggle",
        function(args)
            do_toggle(args)
        end
    )

    cmds.register(
        "apps.toggle.a-or-b",
        function(args)
            running_apps = apps.runningApplications()

            app = nil
            for _,running_app in pairs(running_apps) do
                if running_app:name() == args[1] then
                    app = args[1]
                end
            end

            if app then
                do_toggle(app)
            else
                do_toggle(args[2])
            end
                
        end
    )
end

return {
    init = init
}
