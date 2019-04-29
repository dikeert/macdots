local hs = {
    window = require 'hs.window'
}

local config = require 'config'
local apps = require 'apps'
local windows = require 'windows'
local keys = require 'keys'
local utils = require 'utils'

hs.window.animationDuration = 0

apps.init()
windows.init(config.windows)
utils.init()
keys.init(config.keys)
