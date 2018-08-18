local Class = require("Class")

local Head = Class:derive("Head")

function Head:new(x, y, theta)
   self.x = x
   self.y = y
   self.theta = theta
   self.phi = 0
   self.theta_direction = 1
end

function Head:update(dt)
   self.phi = self.phi + 0.03

   self.theta = self.theta + (self.theta_direction * 0.02)
   if self.theta > 0.5 then
      self.theta_direction = -1
   end
   if self.theta < -0.5 then
      self.theta_direction = 1
   end
end

function Head:draw()
   -- origin
   love.graphics.translate(self.x, self.y)
   love.graphics.rotate(self.theta)    

   -- mouth
   love.graphics.arc("fill", 0, 100, 30, 0, math.pi)
   -- left eye
   love.graphics.translate(-110, -50)
   love.graphics.rotate(self.phi)
   love.graphics.circle("fill", 0, 0, 50, 8)
   love.graphics.rotate(-self.phi)
   love.graphics.translate(110, 50)

   -- right eye
   love.graphics.translate(90, -50)
   love.graphics.rotate(-self.phi)
   love.graphics.circle("fill", 0, 0, 50, 8)
   love.graphics.rotate(self.phi)
   love.graphics.translate(-90, 50)

   -- nose
   love.graphics.line(0,0, -10,30) 
   love.graphics.ellipse("line", 0, 0, 180, 220, 100)

   -- pop origin
   love.graphics.rotate(-self.theta)
   love.graphics.translate(-self.x, -self.y)
end

return Head
