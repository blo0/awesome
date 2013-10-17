local awful = require("awful")

-- Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
	awful.layout.suit.floating,
	awful.layout.suit.tile,
--	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
--	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
--	awful.layout.suit.fair.horizontal,
--	awful.layout.suit.spiral,
--	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
--	awful.layout.suit.max.fullscreen,
--	awful.layout.suit.magnifier
}

-- Tags and screens
-- Two options, for single or dual display.
tags = {}
if screen.count() == 1 then
	tags1_1 = {
		names = { "term", "www", "trab", "chat", "media", "etc" },
		layout = { layouts[2], layouts[2], layouts[2], layouts[4], layouts[2], layouts[3] }
	}

		tags[1] = awful.tag(tags1_1.names, 1, tags1_1.layout)

else
	tags2_1 = {
		names = { " term ", " www ", " office ", " chat ", " play ", " etc " },
		layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[3] }
	}

	tags2_2 = {
		names = { " term ", " www ", " chat ", " etc " },
		layout = { layouts[1], layouts[3], layouts[1], layouts[3] }
	}

		tags[1] = awful.tag(tags2_1.names, 1, tags2_1.layout)
		tags[2] = awful.tag(tags2_2.names, 2, tags2_2.layout)
end
--
