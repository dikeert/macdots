local cmds = require "cmds"
local chooser = require "hs.chooser"
local fs = require "hs.fs"
local alert = require "hs.alert"

local function make_children_lister(parent)
    return function()
        local choices = {}
        local iter, dir = fs.dir(parent)

        if iter then
            local i = 1
            for file in iter, dir do
                if not (file == "." or file == ".." or file:sub(1, #".") == ".") then
                    table.insert(
                        choices,
                        {
                            ["text"] = file,
                            ["subText"] = string.format("%s/%s", parent, file),
                            ["uuid"] = string.format("000%s", i)
                        }
                    )
                    i = i + 1
                end
            end
        else
            alert.show(string.format("Error: %s", dir))
        end

        return choices
    end
end

local function make_handler(app)
    return function(val)
        if val then
            hs.execute("open " .. "-a" .. " '" .. app .. "' " .. val.subText)
        end
    end
end

local function show_prompt(parent, app)
    prompt = chooser.new(make_handler(app))
    prompt:choices(make_children_lister(parent))
    prompt:show()
end

local function init()
    cmds.register(
        "dir.open-in",
        function(args)
            if #args == 2 then
                local parent = args[1]
                local app = args[2]

                show_prompt(parent, app)
            else
                alert.show("Invalid config, expected two arguments!")
            end
        end
    )
end

return {
    init = function()
        init()
    end
}
