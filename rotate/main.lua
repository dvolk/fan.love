local flux = require('flux')

local Head = require('Head')

local head1
local head2
local text1
local text2

function love.load()
   print("console for debugging")

   text1 = {}
   text1.x = -100
   text1.y = 50

   text2 = {}
   text2.x = 900
   text2.y = 550

   head1 = Head(-200, 300, 0.51)
   head2 = Head(1000, 300, -0.51)

   flux.to(head1, 2, { x = 200, y = 300 }):ease('elasticout')
   flux.to(head2, 2, { x = 600, y = 300 }):ease('elasticout')

   flux.to(text1, 1, { x = 380, y = 50 }):delay(1)
   flux.to(text2, 1, { x =  380, y = 550 }):delay(1)
end

function love.update(dt)
   head1:update(dt)
   head2:update(dt)
   flux.update(dt)
end

function love.draw()
   love.graphics.print("Hi Lovely Bunny", text1.x, text1.y)
   head1:draw()
   head2:draw()
   love.graphics.print("Good night Bunny", text2.x, text2.y)

end
