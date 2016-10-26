--A game by Davierocket/Mint
--The goal of this game is to pelt Emerald with Footballs until he becomes a MAN
--Should start off with a menu which leads into an animation/cutscene and the main game. 
--During the main game, SPACE or click the button to launch a football at emerald. After 48 (or a random number between 40 and 60) balls, the game is over and it 
--loads a game over screen for quitting or restarting the game again.

--And yes, I comment a lot.


--INITIAL STUFF
require "menu"
require "dudebro"
require "emerald"
--require "taunts"

function love.load()
	--stats
	gametext = love.graphics.newFont(45)
	aWinnerIsYou = false --flag for reaching ball limit
	times = 0 --balls thrown
	winplaycount = 0 --for audio. I'm getting loops when I play the win noise and I don't know why
	tauntEm = "test"
		
	--Tunes
	bgm = love.audio.newSource("sound/BG_main.mp3")
	punch = love.audio.newSource("sound/FBpunch.wav", "static")
	winNoise = love.audio.newSource("sound/TUNE_manNow.wav")
	bgm:setVolume(0.6)
	punch:setVolume(0.3)
	winNoise:setVolume(0.6)
	winNoise:setLooping(false)
	
	--Images
	footballButton = love.graphics.newImage("pics/button.png")
	bg = love.graphics.newImage("pics/bg.png")
	help = love.graphics.newImage("pics/help.png")
	repeatButton = love.graphics.newImage("pics/repeatButton.png")
	startButton = love.graphics.newImage("pics/startButton.png")
	menubg = love.graphics.newImage("pics/menu.png")
	
	love.graphics.setBackgroundColor(255,255,255)
	--start game on a menu
	gamestate = "menu"
--	gamestate = "playing"
	
	--Get menu button 
	button_spawn(200, 200, "BECOME A MAN", "start")
	button_spawn(200, 500, "Wimp out, chicken", "quitscreen")
	button_spawn(600, 20, "Options", "options")
	--Menu pic buttons 
	picButton_spawn(200, 300, repeatButton, "start", "menu")
	picButton_spawn(100, 100, startButton, "quitscreen", "menu")
	--Get the button for pressing the ball
	picButton_spawn(100, 100, startButton, "quitscreen", "menu")
	
	--Do I spawn ALL buttons here at the beginning? for bigger games I'm feeling it would slow things down.
	--option buttons go here
	--button_spawn(600, 20, "Volume Up", "volUp")
	--button_spawn(600, 20, "Volume Down", "volDwn")
	
	picButton_spawn(300, 550, footballButton, "toss", "game" )
	
	bgm:play()
end

function love.mousepressed(x,y)
	button_click(x,y) --for clicked areas inside text buttons
	picButton_click(x,y)

end


function love.update(dt) --the comp part
	if gamestate == "playing" then
		--Insert logic for update here, if needed
	end
end

function love.keypressed(key) 
	--quit game. Needs a double-check at some point.
	if key == "escape" then 
			love.event.push("quit")
				end
--tosses ball on space key			
	if gamestate == "playing" then --So players don't rack up points while still in the menu
		if key == "space" then 
			throwYerBall() 
		end
		if key == "z" then 
			tauntEm = "filler message" --placeholder for taunts. tba later
		end
	end
end

function love.draw() --what's visible
	love.graphics.setColor(255,255,255) --I was getting weird errors before I initialized this.
	if gamestate == "menu" then
		love.graphics.draw(menubg)
		button_draw()
		picButton_draw("menu")
		
	end
	if gamestate == "playing" then
		love.graphics.setFont(gametext)
		love.graphics.draw(bg)
		picButton_draw("game")
		if love.keyboard.isDown("h") then
			love.graphics.draw(help,20,20)
		end 
		love.graphics.print('Testin.', 400, 300)
		love.graphics.print(bro.ballCount, 300, 300) --debug/score
	
		broDraw()
		emeraldDraw()
	
	end
end



