function love.conf(t)

	t.modules.joystick = false --don't need this for this game. It'll make starting faster too
	t.title = "Football Made a MAN out of my son"
	t.window.width = 900
	t.window.height = 700
	t.window.icon = "pics/iconem.png" --not sure if this is working or not
	
	t.console = true --turn this off before finishing game!!
end

--I might have forgotten some other settings