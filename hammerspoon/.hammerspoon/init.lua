local hs = {
    window = require 'hs.window'
}

local config = require 'config'
local apps = require 'apps'
local windows = require 'windows'
local utils = require 'utils'
local cde = require 'cde'
local keys = require 'keys'

hs.window.animationDuration = 0

apps.init()
windows.init(config.windows)
utils.init()
cde.init()
keys.init(config.keys)
