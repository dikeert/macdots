local cmds = require "cmds"
local chooser = require "hs.chooser"
local fs = require "hs.fs"
local alert = require "hs.alert"

local function init()
    cmds.register(
        "cde.src",
        function(args)
            prompt =
                chooser.new(
                function(val)
                    if val then
                        hs.execute("open " .. "-a" .. " 'Visual Studio Code' " .. val.subText)
                    end
                end
            )

            prompt:choices(
                function()
                    local choices = {}
                    local iter, dir = fs.dir(args)

                    if iter then
                        local i = 1
                        for file in iter, dir do
                            if not (file == '.' or file == '..' or file:sub(1, #'.') == '.') then
                                table.insert(choices, {
                                    ["text"] = file,
                                    ["subText"] = string.format("%s/%s", args, file),
                                    ["uuid"] = string.format("000%s", i)
                                })
                                i = i + 1 
                            end
                        end
                    else
                        alert(string.format("Error: %s", dir))
                    end

                    return choices
                end
            )

            prompt:show()
        end
    )
end

return {
    init = function()
        init()
    end
}
