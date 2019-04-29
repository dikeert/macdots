local rules = require 'rules'
local cmds = require 'cmds'

local cfg = nil

local function error_missing(name)
    error(string.format('Missing %q configuration parameter', name))
end

local function cfg_require_tolerance(cfg)
    if cfg.tolerance == nil then
        error_missing('tolerance')
    end
end

local function cfg_require_layout(cfg)
    if cfg.layout == nil then
        error_missing('layout')
    end
end

local function cfg_require_layout_default(cfg)
    if cfg.default == nil then
        error_missing('layout.default')
    end
end

local function cfg_require_layout_default_planes(cfg)
    if cfg.vertical == nil then
        error_missing('layout.default.vertical')
    end

    if cfg.horizontal == nil then
        error_missing('layout.default.horizontal')
    end
end

local function cfg_require_layout_default_plane_components(cfg, name)
    if cfg.center == nil then
        error_missing('layout.default.' .. name .. '.center')
    end

    if cfg.length == nil then
        error_missing('layout.default.' .. name .. '.length')
    end
end

local function cfg_require_layout_default_left(cfg)
    if cfg.left == nil then
        error_missing('layout.default.left')
    end
end

local function cfg_require_layout_default_left_components(cfg)
    if cfg.position == nil then
        error_missing('layout.default.left.position')
    end

    if cfg.length == nil then
        error_missing('layout.default.left.position')
    end
end

local function cfg_require_default_grow(cfg)
    if cfg.grow == nil then
        error_missing('layout.default.grow')
    end
end

local function cfg_require_default_grow_components(cfg)
    if cfg.step == nil then
        error_missing('layout.default.grow.step')
    end
end

local function cfg_validate_layout_default(cfg)
    cfg_require_layout_default_planes(cfg)
    cfg_require_layout_default_plane_components(cfg.vertical, 'vertical')
    cfg_require_layout_default_plane_components(cfg.horizontal, 'horizontal')
    cfg_require_layout_default_left(cfg)
    cfg_require_layout_default_left_components(cfg.left)
    cfg_require_default_grow(cfg)
    cfg_require_default_grow_components(cfg.grow)
end

local function cfg_validate_layout(cfg)
    cfg_require_layout_default(cfg)
    cfg_validate_layout_default(cfg.default)
end

local function cfg_validate(cfg)
    cfg_require_tolerance(cfg)
    cfg_require_layout(cfg)
    cfg_validate_layout(cfg.layout)
end

local function get_layout(override)
    return rules.windows.apply(cfg, override)
end

local function get_hs_objects()
    local hs = require 'hs.window'

    local win = hs.focusedWindow()
    local frame = win:frame()
    local screen = win:screen():frame()

    return screen, win, frame
end

local function is_maximized(screen, window)
    return (screen.h - window.h) < cfg.tolerance and (screen.w - window.w) < cfg.tolerance
end

local function is_tall(screen, window)
    return (screen.h - window.h) < cfg.tolerance and (screen.w - window.w) > cfg.tolerance
end

local function is_left(screen, window)
    local layout = get_layout()

    if is_tall(screen, window) then
        return false
    else
        return ((window.x - layout.left.position) < cfg.tolerance) and (screen.w * layout.left.length - window.w) < cfg.tolerance
    end
end

local function maximize(screen, window)
    local layout = get_layout()

    if is_maximized(screen, window) then
        return window
    else
        return {
            w = screen.w,
            h = screen.h,
            x = 0,
            y = 0
        }
    end
end

local function make_tall(screen, window)
    local layout = get_layout()

    if is_tall(screen, window) then
        return maximize(screen, window)
    else
        return {
            w = window.w,
            h = screen.h,
            x = window.x,
            y = 0
        }
    end
end

local function get_axis_placement(axis, center, length)
    local center = axis * center
    local length = axis * length
    local position = center - (length / 2)

    return length, position
end

local function make_center_vertical(layout, screen, window)
    local height, y = get_axis_placement(screen.h, layout.vertical.center, layout.vertical.length)

    return {
        w = window.w,
        h = height,
        x = window.x,
        y = y
    }
end

local function make_center_horizontal(layout, screen, window)
    local width, x = get_axis_placement(screen.w, layout.horizontal.center, layout.horizontal.length)

    return {
        w = width,
        h = window.h,
        x = x,
        y = window.y
    }
end

local function make_center(screen, window)
    local layout = get_layout(true)

    local result = window

    if is_maximized(screen, window) or is_left(screen, window) or not is_tall(screen, window)
    then
        result = make_center_horizontal(layout, screen, result)
    end

    return make_center_vertical(layout, screen, result)
end

local function make_left(screen, window)
    local layout = get_layout()

    return {
        w = screen.w * layout.left.length,
        h = window.h,
        x = screen.w * layout.left.position,
        y = window.y
    }
end

local function accomodate_window_left()
	-- if window fits into gap between center window position
	-- then center it in this gap
	local layout = get_layout()
	local screen, window, frame = get_hs_objects()

	center = make_center_horizontal(layout, screen, frame)
	available_width = center.x

	if available_width > frame.w then
		frame.x = (available_width / 2) - (frame.w / 2)
		window:setFrame(frame)
	end
end

local function make_right(screen, window)
	local layout = get_layout()

	width = screen.w * layout.right.length
	x = screen.w - width - screen.w * layout.right.position

	return {
		w = width,
		h = window.h,
		x = x,
		y = window.y
	}
end

local function accomodate_window_right()
	local layout = get_layout()
	local screen, window, frame = get_hs_objects()

	local center = make_center_horizontal(layout, screen, frame)
	local left_edge = center.x + center.w
	local available_width = screen.w - left_edge

	-- if window fits in the gap between right edge of a centered window
	-- and the screen's right edge, then center window in that gap
	if available_width > frame.w then
		offset = (available_width / 2) - (frame.w / 2)
		frame.x = left_edge + offset
		window:setFrame(frame)
	end

	-- if window does not fit in the gap between right edge of a centered window
	-- and the screens' right edge, then put window right border at then
	-- right edge of the screen
	if available_width < frame.w then
		frame.x = screen.w - frame.w
		window:setFrame(frame)
	end
end

local function grow_horizontal(screen, window)
    local layout = get_layout()

    local length = screen.w * layout.grow.step

    local w = nil
    local x = nil

    if math.abs(screen.w - window.w)  <= cfg.tolerance then
        w = screen.w
        x = 0
    else
        w = window.w + length
        x = window.x - (length / 2)
    end

    return {
        w = w,
        h = window.h,
        x = x,
        y = window.y
    }
end

local function shrink_horizontal(screen, window)
    local layout = get_layout()

    local length = screen.w * layout.grow.step

    local w = window.w - length
    local x = window.x + (length / 2)

    return {
        w = w,
        h = window.h,
        x = x,
        y = window.y
    }
end

local function init(config)
    if not config then
        error('No configuration provided')
    end

    cfg_validate(config)

    cfg = config

    cmds.register('wnd.tall', function()
        local screen, window, frame = get_hs_objects()

        window:setFrame(make_tall(screen, frame))
    end)

    cmds.register('wnd.cntr', function()
        local screen, window, frame = get_hs_objects()

        window:setFrame(make_center(screen, frame))
    end)

    cmds.register('wnd.left', function()
			local screen, window, frame = get_hs_objects()

			window:setFrame(make_left(screen, frame))
			accomodate_window_left()
    end)

		cmds.register('wnd.right', function()
			local screen, window, frame = get_hs_objects()

			window:setFrame(make_right(screen, frame))
			accomodate_window_right()
		end)

    cmds.register('wnd.growh', function()
        local screen, window, frame = get_hs_objects()

        window:setFrame(grow_horizontal(screen, frame))
    end)

    cmds.register('wnd.shrinkh', function()
        local screen, window, frame = get_hs_objects()

        window:setFrame(shrink_horizontal(screen, frame))
    end)
end

return {
    init = init,
    is_maximized = is_maximized,
    is_tall = is_tall,
    is_left = is_left,
    make_tall = make_tall,
    make_center = make_center,
    make_left = make_left,
		make_right = make_right,
    grow_horizontal = grow_horizontal,
    shrink_horizontal = shrink_horizontal
}
