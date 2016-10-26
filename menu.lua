
button = {}
picButton = {}
--Generic button.
--This makes a Text button for now. I'll have to figure out how to do a picture button later.
function button_spawn(x,y,text, id)
	table.insert(button, {x=x, y=y, text=text, id=id})
	
end

--hopefully I can copy the routine for a text button to do picture buttons...
function picButton_spawn(x,y,image, id, gamestate)
	table.insert(picButton, {x=x, y=y, image =image, id=id, gamestate=gamestate})
	
end


function button_draw()
	for i,v in ipairs(button) do
		love.graphics.setColor(200,0,0)
		love.graphics.setFont(gametext)
		love.graphics.print(v.text, v.x, v.y)
	end

end

function picButton_draw(gamestate)
	for i,v in ipairs(picButton) do
		if v.gamestate == gamestate then
			love.graphics.setColor(255,255,255)
			love.graphics.draw(v.image, v.x, v.y)
		end
	end

end

function button_click(x,y)
	for i, v in ipairs(button) do
		 if x > v.x and
			x < v.x + gametext:getWidth(v.text) and
			y > v.y and
			y < v.y + gametext:getHeight() then
				if v.id == "quitscreen" then
				love.event.push("quit")
				end
				if v.id == "start" then
					gamestate = "playing"
				end
		end
	end
end


function picButton_click(x,y)
--Checks to see if a mouseclick occurs within image. Kinda the same thing as button_click except for images
for i, v in ipairs(picButton) do
		 if x > v.x and
			x < v.x + v.image:getWidth() and
			y > v.y and
			y < v.y + v.image:getHeight() then
				if v.id == "quitscreen" then
				love.event.push("quit")
				end
				if v.id == "start" then
					gamestate = "playing"
				end
				if v.id == "toss" then
					throwYerBall()	
				end
				--if id == "attack"
		end
	end


end