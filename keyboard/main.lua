function love.load()
	angle = 0
	r = 300
	angle_per_second = 2*math.pi
	print_dt = 0
	yf = love.graphics.newImage("yf.png")
	
end

function love.draw()
    love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", 400, 300, 300)
    love.graphics.setColor(255, 255, 255)
	love.graphics.draw(yf, x, y)
	love.graphics.circle("fill", x+140, y+140, 10)
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		angle = angle + angle_per_second * dt
	end
	if love.keyboard.isDown("left") then
		angle = angle - angle_per_second * dt
	end
	if love.keyboard.isDown("up") then
		r = r + 200 * dt
	end
	if love.keyboard.isDown("down") then
		r = r - 200 * dt
	end

	x = 400-140 + r * math.sin(angle)
	y = 300-140 + r * math.cos(angle)
			
	print_dt = dt

end
