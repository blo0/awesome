local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
				{ "Manual", terminal .. " -e man awesome" },
--				{ "Configurações", editor_cmd .. " " .. awesome.conffile },
				{ "Reiniciar", awesome.restart },
--				{ "Sair", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "Terminal", terminal },
									{ "Firefox", "firefox" },
									{ "Arquivos", "pcmanfm" },
									{ "           ---" },
									{ "Awesome", myawesomemenu },
									{ "           ---" },
									{ "Sair", '/usr/bin/exit.sh' },
									}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
									 menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
--
