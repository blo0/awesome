---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Play 8"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#051D2A"
theme.bg_minimize   = "#000000"
theme.bg_systray    = "#000000"

theme.fg_normal     = "#FFFFFF"
theme.fg_focus      = "#179FFF"
theme.fg_urgent     = "#FFFFFF"
theme.fg_minimize   = "#CCCCCC"

theme.border_width  = 1
theme.border_normal = "#121212"
theme.border_focus  = "#1793D1"
theme.border_marked = "#FFFFFF"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/lala/.config/awesome/themes/bloo/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/lala/.config/awesome/themes/bloo/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 110

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/lala/Imagens/Danboards/Sparky.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/lala/.config/awesome/themes/bloo/layouts/fairh.png"
theme.layout_fairv = "/home/lala/.config/awesome/themes/bloo/layouts/fairv.png"
theme.layout_floating  = "/home/lala/.config/awesome/themes/bloo/layouts/floating.png"
theme.layout_magnifier = "/home/lala/.config/awesome/themes/bloo/layouts/magnifier.png"
theme.layout_max = "/home/lala/.config/awesome/themes/bloo/layouts/max.png"
theme.layout_fullscreen = "/home/lala/.config/awesome/themes/bloo/layouts/floating_a.png" --should be fullscreen.png
theme.layout_tilebottom = "/home/lala/.config/awesome/themes/bloo/layouts/tilebottom.png"
theme.layout_tileleft   = "/home/lala/.config/awesome/themes/bloo/layouts/tileleft.png"
theme.layout_tile = "/home/lala/.config/awesome/themes/bloo/layouts/tile.png"
theme.layout_tiletop = "/home/lala/.config/awesome/themes/bloo/layouts/tiletop.png"
theme.layout_spiral  = "/home/lala/.config/awesome/themes/bloo/layouts/spiral.png"
theme.layout_dwindle = "/home/lala/.config/awesome/themes/bloo/dwindle.png"

theme.awesome_icon = "/home/lala/.config/awesome/themes/bloo/ArchLogo10.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
