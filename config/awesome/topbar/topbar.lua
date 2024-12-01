local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local dpi = beautiful.xresources.apply_dpi

local function set_wallpaper(s)
  local wallpaper = os.getenv("HOME") .. "/.config/awesome/wallpaper/wallpaper-1.jpg"

  -- Verificar si la imagen de fondo existe
  if gears.filesystem.file_readable(wallpaper) then
    -- Establecer la imagen de fondo
    gears.wallpaper.maximized(wallpaper, s)
  else
    -- Si la imagen de fondo no existe, imprimir un mensaje de error
    naughty.notify({
      title = "Error",
      text = "La imagen de fondo no existe o no es accesible.",
      preset = naughty.config.presets.critical
    })
  end
  -- Wallpaper
  -- if beautiful.wallpaper then
  --   local wallpaper = beautiful.wallpaper
  --   -- If wallpaper is a function, call it with the screen
  --   if type(wallpaper) == "function" then
  --     wallpaper = wallpaper(s)
  --   end
  --   gears.wallpaper.maximized(wallpaper, s, true)
  -- end
end
myawesomemenu = {
  { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }
})


mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

local tasklist = require("topbar.tasklist")
local taglist = require("topbar.taglist")
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

  -- Create a taglist widget
  taglist.taglist(s)

  -- Create a tasklist widget
  tasklist.tasklist(s)

  -- Create the wibox
  s.mywibox = awful.wibar({

    position = "top",
    screen = s,
    height = dpi(40),
    bg = "#00000000",
    --
    -- fg = "#a5adcb", -- Texto
    -- border_color = "#8aadf4",
    -- border_width = 5,
    opacity = 1,
    -- shape = function(cr, width, height)
    --   gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 20)
    -- end,
    -- shape_border_width = 3 -- Ancho del borde redondeado
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    {
      {
        {
          {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            { -- Left widgets
              layout = wibox.layout.fixed.horizontal,
              -- wibox.widget.textbox("     "),
              mylauncher,
              wibox.widget.textbox("     "),
              s.mytaglist,
              -- wibox.widget.textbox("     "),
              s.mytasklist,
              wibox.widget.textbox("     "),
              s.mypromptbox,
            },
            -- nil,
            {
              layout = wibox.layout.fixed.horizontal,
              mytextclock,
            },
            { -- Right widgets
              layout = wibox.layout.fixed.horizontal,
              mykeyboardlayout,
              wibox.widget.systray(),
              s.mylayoutbox,
              -- wibox.widget.textbox("     "),
            }

          },
          widget = wibox.container.margin,
          top = dpi(3),    -- Margen superior
          bottom = dpi(3), -- Margen inferior
          left = dpi(10),  -- Margen izquierdo
          right = dpi(10), -- Margen derecho
        },

        widget = wibox.container.background,
        bg = "#24273a",
        shape = function(cr, width, height)
          gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 10)
        end,
      },
      -- widget = wibox.container.background,
      widget = wibox.container.margin,
      top = dpi(3),    -- Margen superior
      bottom = dpi(0), -- Margen inferior
      left = dpi(10),  -- Margen izquierdo
      right = dpi(10), -- Margen derecho

    },
    widget = wibox.container.background,
    -- bg = "#00000000"
  }

 end)
-- }}}
