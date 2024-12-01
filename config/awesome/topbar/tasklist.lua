local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi


local M = {}
M.tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)


M.tasklist = function(s)
  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = M.tasklist_buttons,
    style = {
      border_whidth = 1,
      border_color = "#777777",
      shape = gears.shape.rounded_bar,
      disable_task_name = true
    },
    layout = {
      spacing        = 10,
      spacing_widget = {
        {
          forced_width = 5,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator
        },
        valign = "center",
        halign = "center",
        widget = wibox.container.place,
      },
      layout         = wibox.layout.flex.horizontal
    },

    widget_template = {
      {
        {
          {
            {
              id     = "icon_role",
              widget = wibox.widget.imagebox,
            },
            margins = 2,
            widget  = wibox.container.margin,
          },
          {
            id     = "text_role",
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left   = 10,
        right  = 10,
        widget = wibox.container.margin
      },
      id     = "background_role",
      widget = wibox.container.background,
    },
  }
end

return M
