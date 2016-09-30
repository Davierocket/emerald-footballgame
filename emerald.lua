--File for the enemies, or in this game, the single enemy, EMERALD.

em = {}
em.health = 48 --he can take 48 balls before he gets tired. Hue. 
em.emHitAnim = love.graphics.newImage("pics/emerald_hit.png")
em.defaultAnim = love.graphics.newImage("pics/emerald.png")
em.ManAnim = love.graphics.newImage("pics/emerald_man.png")
em.x = 100
em.y = 450
em.rotate = 0
em.picScaleX = 0.4
em.picScaleY = 0.4
emeraldPic = em.defaultAnim --what's visible

function emeraldDraw()
	love.graphics.setColor(255,255,255) --sets player bg color.
	love.graphics.draw(emeraldPic, em.x, em.y, em.rotate, em.picScaleX, em.picScaleY)

end