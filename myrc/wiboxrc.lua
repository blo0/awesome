local awful = require("awful")
local wibox = require("wibox")
vicious = require("vicious")
vicious.contrib = require("vicious.contrib")

-- Separators
spacer = wibox.widget.textbox(" ")
bullet = wibox.widget.textbox(" • ")
wall = wibox.widget.textbox("│")

-- Wibox
-- Clock widget
clockwidget = wibox.widget.textbox()
-- Register widget
vicious.register(clockwidget, vicious.widgets.date, "%d/%m/%Y  •  %R", 60)
-- Clock icon
clockicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/clock.png")

-- Battery progressbar
batbar = awful.widget.progressbar()
-- Battery progressbar properties
batbar:set_width(50)
batbar:set_height (10)
batbar:set_background_color("#CCCCCC")
batbar:set_border_color("#FFFFFF")
batbar:set_color("#1793D1")
-- Register batbar 
vicious.register(batbar, vicious.widgets.bat, "$2", 61, "BAT1")
-- Battery icon
baticon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/bat_full_01.png") 
-- Battery margin (needed to progressbar)
local batmargin = wibox.layout.margin(batbar,3,2,6,6)
-- Battery text
battext = wibox.widget.textbox()
-- Register battext
vicious.register(battext, vicious.widgets.bat, "$2% $1", 61, "BAT1")

-- Volume progressbar
volbar = awful.widget.progressbar()
-- Volumebar progressbar properties
volbar:set_width(50)
volbar:set_height(6)
volbar:set_vertical(false)
volbar:set_background_color("#CCCCCC")
volbar:set_border_color("#FFFFFF")
volbar:set_color("#1793D1")
-- Register volbar
vicious.register(volbar, vicious.widgets.volume, "$1", 1, "Master")
-- Volume icon
volicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/spkr_01.png")
-- Volume margin (needed to progressbar)
local volmargin = wibox.layout.margin(volbar,3,2,6,6)
-- Volume text
voltext = wibox.widget.textbox()
-- Register voltext
vicious.register(voltext, vicious.widgets.volume, "$1%", 1, "Master")

-- Wifi widget
-- Wifi icon
wifiicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/wifi_01.png")
-- Wifi text
wifitext = wibox.widget.textbox()
-- Register wifitext
vicious.register(wifitext, vicious.widgets.wifi,  "${linp}%", 5, "wlp2s0")
-- Net text (need vicious cache to separated ↑ up and ↓ down - if you want two icons and not symbols)
nettext = wibox.widget.textbox()
-- Register nettext
vicious.register(nettext, vicious.widgets.net, "   ↑ ${wlp2s0 up_kb}   ↓ ${wlp2s0 down_kb}", 3)

-- Cpu widget
-- Cpu icon
cpuicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/cpu.png")
-- Cpu text
cputext = wibox.widget.textbox()
-- Register cputext
vicious.register(cputext, vicious.widgets.cpu, "$1%", 3)

-- Memory widget
-- Memory icon
memicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/mem.png")
-- Memory text
memtext = wibox.widget.textbox()
-- Register memtext
vicious.register(memtext, vicious.widgets.mem, "$1%", 10)

-- Pacman widget
-- Pacman icon
pacicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/pacman.png")
-- Pacman text
pactext = wibox.widget.textbox()
-- Register updtext
vicious.register(pactext, vicious.widgets.pkg, "$1", 300, "Arch")

-- Uptime widget
uptext = wibox.widget.textbox()
-- Register uptext
vicious.register(uptext, vicious.widgets.uptime, "Uptime: $2h$3min", 1)
-- Uptime icon
upicon = wibox.widget.imagebox("/home/lala/.config/awesome/themes/bloo/icons/blue/clock.png")

-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
					awful.button({ }, 1, awful.tag.viewonly),
					awful.button({ modkey }, 1, awful.client.movetotag),
					awful.button({ }, 3, awful.tag.viewtoggle),
					awful.button({ modkey }, 3, awful.client.toggletag),
					awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
					awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
					)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
					 awful.button({ }, 1, function (c)
											if c == client.focus then
												c.minimized = true
											else
												-- Without this, the following
												-- :isvisible() makes no sense
												c.minimized = false
												if not c:isvisible() then
													awful.tag.viewonly(c:tags()[1])
												end
												-- This will also un-minimize
												-- the client, if needed
												client.focus = c
												c:raise()
											end
										end),
					awful.button({ }, 3, function ()
											if instance then
												instance:hide()
												instance = nil
											else
												instance = awful.menu.clients({ width=250 })
											end
										end),
					awful.button({ }, 4, function ()
											awful.client.focus.byidx(1)
											if client.focus then client.focus:raise() end
										end),
					awful.button({ }, 5, function ()
											awful.client.focus.byidx(-1)
											if client.focus then client.focus:raise() end
										end))

for s = 1, screen.count() do
	-- Create a promptbox for each screen
	mypromptbox[s] = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	mylayoutbox[s] = awful.widget.layoutbox(s)
	mylayoutbox[s]:buttons(awful.util.table.join(
						awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
						awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
						awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
						awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
	-- Create a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

	-- Create a tasklist widget
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

	-- Create the wibox
	mywibox[s] = awful.wibox({ position = "top", screen = s })

	-- Widgets that are aligned to the left
	local left_layout = wibox.layout.fixed.horizontal()
	left_layout:add(mylauncher)
	left_layout:add(spacer)
	left_layout:add(mytaglist[s])
	left_layout:add(mypromptbox[s])

	-- Widgets that are aligned to the right
	local right_layout = wibox.layout.fixed.horizontal()
	if s == 1 then right_layout:add(wibox.widget.systray()) end
	right_layout:add(clockicon)
	right_layout:add(clockwidget)
	right_layout:add(spacer)
	right_layout:add(bullet)
	right_layout:add(spacer)
	right_layout:add(mylayoutbox[s])

	-- Now bring it all together (with the tasklist in the middle)
	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(mytasklist[s])
	layout:set_right(right_layout)

	mywibox[s]:set_widget(layout)
    
	-- Create bottom wibox
	mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s })

	-- Widgets that are aligned to the middle
	local bottom_left_layout = wibox.layout.fixed.horizontal()
	bottom_left_layout:add(volicon)
	bottom_left_layout:add(volmargin)
	bottom_left_layout:add(spacer)
	bottom_left_layout:add(voltext)
    
	local bottom_right_layout = wibox.layout.fixed.horizontal()
	bottom_right_layout:add(baticon)
	--bottom_left_layout:add(batmargin)
	bottom_right_layout:add(battext)
	bottom_right_layout:add(spacer)
	bottom_right_layout:add(wall)
	bottom_right_layout:add(wifiicon)    
	bottom_right_layout:add(wifitext)
	--bottom_right_layout:add(spacer)
	--bottom_right_layout:add(bullet)
	bottom_right_layout:add(nettext)
	bottom_right_layout:add(spacer)
	bottom_right_layout:add(wall)
	bottom_right_layout:add(cpuicon)
	bottom_right_layout:add(cputext)
	bottom_right_layout:add(spacer)
	bottom_right_layout:add(wall)    
	bottom_right_layout:add(memicon)
	bottom_right_layout:add(memtext)
	bottom_right_layout:add(spacer)
	bottom_right_layout:add(wall)
	bottom_right_layout:add(pacicon)
	bottom_right_layout:add(pactext)
	bottom_right_layout:add(spacer)
	bottom_right_layout:add(wall)
	bottom_right_layout:add(upicon)
	bottom_right_layout:add(uptext)
	-- if s == 1 then bottom_right_layout:add(wibox.widget.systray()) end

	-- Bring Bottom Wibox Together
	local bottom_layout = wibox.layout.align.horizontal()
	bottom_layout:set_left(bottom_left_layout)
	bottom_layout:set_right(bottom_right_layout)
	mybottomwibox[s]:set_widget(bottom_layout)
end
--
