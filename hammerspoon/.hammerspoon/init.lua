local hs = {
    window = require 'hs.window'
}

local config = require 'config'
local apps = require 'apps'
local windows = require 'windows'
local utils = require 'utils'
local dir = require 'dir'
local macro = require 'macro'
local keys = require 'keys'

hs.window.animationDuration = 0

apps.init()
windows.init(config.windows)
utils.init()
dir.init()
macro.init()
keys.init(config.keys)
