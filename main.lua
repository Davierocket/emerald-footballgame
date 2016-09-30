--A game by Davierocket/Mint
--The goal of this game is to pelt Emerald with Footballs until he becomes a MAN
--Should start off with a menu which leads into an animation/cutscene and the main game. 
--During the main game, SPACE or click the button to launch a football at emerald. After 48 (or a random number between 40 and 60) balls, the game is over and it 
--loads a game over screen for quitting or restarting the game again.

--INITIAL STUFF

require "dudebro"
require "emerald"
--require "taunts"

function love.load()
	--stats
	text = love.graphics.newFont(45)
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
	winNoise:setLooping(false) --yet it still loops...
	
	--Images
	FootballButton = love.graphics.newImage("pics/button.png")
	bg = love.graphics.newImage("pics/bg.png")
	help = love.graphics.newImage("pics/help.png")
	repeatButton = love.graphics.newImage("pics/repeatButton.png")
	startButton = love.graphics.newImage("pics/startButton.png")
	menubg = love.graphics.newImage("pics/menu.png")
end



function love.update() --the comp part

--bgm:play() --I dunno if this should go elsewhere, but...
--bro.broPic = bro.stillAnim --reset bro pic 
--stop count once goal is reached
if bro.ballCount == 48 then 
	aWinnerIsYou = true	
	end

if aWinnerIsYou == true then
	bgm:pause()
	if winplaycount < 2 then  --stop playing bg music and play win noise instead. Might be a roundabout way of doing this.
		winNoise:play() --it's supposed to only play the tune once.
		winplaycount = 1
		end
	end
	
	
end

function love.keypressed(key) 
	--quit game. Needs a double-check at some point.
	if key == "escape" then 
			love.event.push("quit")
				end
--tosses ball on space key			
	if key == "space" and bro.ballCount < 48 then 
		throwYerBall()
	end
	if key == "z" then 
		tauntEm = "filler message"
	end
end

function love.draw() --what's visible
	love.graphics.setFont(text)
	love.graphics.draw(bg)
	if love.keyboard.isDown("h") then
		love.graphics.draw(help,20,20)
	end 
	love.graphics.print('Testin.', 400, 300)
	love.graphics.print(bro.ballCount, 300, 300) --debug/score
	
	broDraw()
	emeraldDraw()
end




