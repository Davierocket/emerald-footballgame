--stats for the player, DUDEBRO
--This is a dummy file atm
bro = {}
bro.isThrowing = false
bro.stillAnim = love.graphics.newImage("pics/bath.png")
bro.throwAnim = love.graphics.newImage("pics/bath2.png")
bro.x = 550
bro.y = 450
bro.rotate = 0
bro.picScaleX = 0.8
bro.picScaleY = 0.8
broPic = bro.stillAnim
bro.ballCount = 0 --balls thrown

function isBroThrowing() --toggles pics for bro during throwing animations
	if bro.isThrowing == true then
		broPic = bro.throwAnim
	else 
		broPic = bro.stillAnim
	end
	
end

function taunt()
--prints a random line of text from the insult file when you hit the taunt key
--empty for now.
end

function throwYerBall() 
		bro.broPic = bro.throwAnim --this still doesn't want to update the picture for some reason
		bro.ballCount = bro.ballCount + 1
		if bro.ballCount == 48 then
			winNoise:play()
			bgm:stop()
		end
end

function broDraw()
	love.graphics.setColor(255,255,255) --sets player bg color.
	love.graphics.draw(broPic, bro.x, bro.y, bro.rotate, bro.picScaleX, bro.picScaleY)

end