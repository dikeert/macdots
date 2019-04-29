local commands = {}

local function create_cmd(cmd, action)
    return {
        name = cmd,
        action = action
    }
end

local function get_cmd(name)
    for idx, val in ipairs(commands) do
        if val.name == name then
            return val
        end
    end

    return nil
end

local function exists(name) 
    local cmd = get_cmd(name)

    return cmd ~= nil
end

local function register(cmd, action)
    if exists(cmd) then
        error(string.format('Unable to register command with name %q twice', cmd))
    end

    local command = create_cmd(cmd, action)
    table.insert(commands, command)
end

local function invoke(cmd, args)
    local command = get_cmd(cmd)

    if command == nil then
        error(string.format('Unable to find command: %q', cmd))
    else
        return command.action(args)
    end
end

local function list()
    local cmds = {}

    for idx, cmd in ipairs(commands) do
        table.insert(cmds, cmd.name)
    end

    return cmds
end

local function clear()
    commands = {}
end

return {
    register = register,
    invoke = invoke,
    list = list,
    clear = clear
}