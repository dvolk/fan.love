function love.load()
    print("console for debugging")
    phi = 0
    theta = 1.0
    head_direction = 1
end

function love.update(dt)

    phi = phi + 0.03




    theta = theta + (head_direction * 0.02)
    if theta > 0.5 then
        head_direction = -1
    end
    if theta < -0.5 then
        head_direction = 1
    end
end

function love.draw()
    love.graphics.print("Hi Lovely Bunny", 380, 50 )
    -- origin
    love.graphics.translate(410, 300)

    love.graphics.rotate(theta)    
    -- mouth
    love.graphics.arc( "fill", 0, 100, 30, 0, math.pi )
    -- left eye
    love.graphics.translate(-110, -50)
    love.graphics.rotate(phi)
    love.graphics.circle("fill", 0, 0, 50, 8)
    love.graphics.rotate(-phi)
    love.graphics.translate(110, 50)

    -- right eye
    love.graphics.translate(90, -50)
    love.graphics.rotate(-phi)
    love.graphics.circle("fill", 0, 0, 50, 8)
    love.graphics.rotate(phi)
    love.graphics.translate(-90, 50)

    love.graphics.line(0,0, -10,30) 
    love.graphics.ellipse("line", 0, 0, 180, 220, 100)

    love.graphics.rotate(-theta)
    love.graphics.translate(-410, -300)
    love.graphics.print("Good night Bunny", 380, 550 )

end