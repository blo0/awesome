local beautiful = require("beautiful")
local gears = require("gears")

-- Theme Wallpaper
--if beautiful.wallpaper then
--	for s = 1, screen.count() do
--		gears.wallpaper.maximized("/home/lala/Imagens/Danboards/Sparky.jpg", s, true)
--	end
--end
--

-- Random Wallpapers
-- Get the list of files from a directory. Must be all images or folders and non-empty. 
function scanDir(directory)
	local i, fileList, popen = 0, {}, io.popen
	for filename in popen([[find "]] ..directory.. [[" -type f]]):lines() do
		i = i + 1
		fileList[i] = filename
	end
	return fileList
end

wallpaperList = scanDir("/home/lala/Imagens/Danboards")

-- Apply a random wallpaper on startup.
gears.wallpaper.maximized(wallpaperList[math.random(1, #wallpaperList)], s, true)

-- Apply a random wallpaper every changeTime seconds.
changeTime = 300
	wallpaperTimer = timer { timeout = changeTime }
	wallpaperTimer:connect_signal("timeout", function()
	gears.wallpaper.maximized(wallpaperList[math.random(1, #wallpaperList)], s, true)

-- Stop the timer (we don't need multiple instances running at the same time)
wallpaperTimer:stop()

-- Restart the timer
wallpaperTimer.timeout = changeTime
wallpaperTimer:start()
end)

-- Initial start when rc.lua is first run
wallpaperTimer:start()
--
