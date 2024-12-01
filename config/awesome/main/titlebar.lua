local client = client
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local M = {}

-- buttons for the titlebar
M.buttons = function(c)
  return gears.table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )
end

M.setup_titlebars = function(c)
  c.shape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 10)
  end
end

M.titlebar = function(c)
  awful.titlebar(c):setup {
    {
      { -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = M.buttons(c),
        layout  = wibox.layout.fixed.horizontal
      },
      {   -- Middle
        { -- Title
          align  = "center",
          widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = M.buttons(c),
        layout  = wibox.layout.flex.horizontal
      },
      { -- Right
        awful.titlebar.widget.floatingbutton(c),
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.stickybutton(c),
        awful.titlebar.widget.ontopbutton(c),
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal,
    },

    left = 10,
    right = 10,
    widget = wibox.container.margin,
  }
end


-- client.connect_signal("request::titlebars", function(c)
--   M.titlebar(c)
--
--   -- Aplicar la configuración de las barras de título a cada nueva ventana
--     -- Verificar si la ventana tiene una barra de título
--     if c.type == "normal" then
--       c.shape = function(cr, width, height)
--         gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 10)
--       end
--     end
-- end)

local rounded_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
end

client.connect_signal("manage", function(c)
    -- Aplicar la decoración de ventana personalizada
    c.shape = rounded_shape
end)
