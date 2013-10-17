-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
awful.autofocus = require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
-- Vicious
vicious = require("vicious")

-- Error handling
require("myrc.error")
--

-- Tags
require("myrc.tags")
--

-- Themes
-- Define colours, icons, and wallpapers
beautiful.init("/home/lala/.config/awesome/themes/bloo/theme.lua")
--

-- Variable definitions
-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
--

-- Default modkey.
modkey = "Mod4"
--

-- Wallpaper
require("myrc.wallpaper")
--

-- Menu
require("myrc.menu")
--

-- Wibox
require("myrc.wiboxrc")
--

-- Key and mouse bindings
require("myrc.binds")
-- Set keys
root.keys(globalkeys)
--

-- Rules
require("myrc.rules")
--

-- Signals
require("myrc.signals")
--
