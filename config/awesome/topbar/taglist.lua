local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local bg_taglist = gears.color({
  type = "linear",
  -- from = { 19, 10 },
  -- to = { 90, 100},
  from = { 90, 100 },
  to = { 19, 10 },

  stops = { { 0, "#24273a" }, { 0.25, "#c6a0f6" }, { 0.5, "#dda4ba" }, { 0.75, "#f5a97f" }, { 1, "#24273a" } }
})
local M = {}

M.taglist_button = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)


M.taglist = function(s)
  s.mytaglist = wibox.widget {
    {
      awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {
          spacing = 5,
          layout = wibox.layout.fixed.horizontal
        },
        style = {
          shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 4)
          end,

        },
        widget_template = {
          {
            {
              {

                {
                  id     = "text_role",
                  widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
              },
              left   = 5,
              right  = 5,
              widget = wibox.container.margin,
              -- widget = wibox.container.background,
            },
            id     = "background_role",
            widget = wibox.container.background,
            fg     = "#ffffff",

          },

          widget = wibox.container.background,

        },
        buttons = M.taglist_button,
      },
      left   = dpi(10),
      right  = dpi(10),
      top    = dpi(2),
      bottom = dpi(2),
      widget = wibox.container.margin
    },
    widget = wibox.container.background,
    -- shape = gears.shape.rounded_rect,
    bg = bg_taglist,

  }
end

return M
