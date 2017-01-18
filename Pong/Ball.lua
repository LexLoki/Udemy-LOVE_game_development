local u = require 'utils'

local Ball = {}

Ball.radius = 20
Ball.color = {0,255,255}

local decreaseAngle

function Ball.new(x,y,speed)
	local self = {
		x=x, y=y, speed = speed, lastx = x, lasty = y
	}
	setmetatable(self, {__index=Ball})
	return self
end

function Ball:update(dt)
	self.lastx = self.x
	self.lasty = self.y
	self.x = self.x + self.speed.x*dt
	self.y = self.y + self.speed.y*dt
	local w,h = love.graphics.getDimensions()
	if self.x>w-self.radius then
		self.speed.x = -self.speed.x
		self.x = 2*(w-self.radius)-self.x
	elseif self.x<self.radius then
		self.speed.x = -self.speed.x
		self.x = 2*self.radius-self.x
	end
	if self.y>h-self.radius then
		self.speed.y = -self.speed.y
		self.y = 2*(h-self.radius)-self.y
	elseif self.y<self.radius then
		self.speed.y = -self.speed.y
		self.y = 2*self.radius-self.y
	end
	--print(u.angle(self.speed))
end

function Ball:angle()
	return u.angle(self.speed)
end

function Ball:reflectX(dir)
	self.speed.x = -self.speed.x
	if dir ~= 0 then
		--self.speed = u.rotate(self.speed,decreaseAngle(math.pi/2,u.angle(self.speed),dir))
	end
	print('refx')
end

function Ball:reflectY(dir)
	self.speed.y = -self.speed.y
	if dir ~=0 then
		--self.speed = u.rotate(self.speed,decreaseAngle(math.pi,u.angle(self.speed),dir))
	end

	print('refy')
end

function decreaseAngle(ref, angle, dir)
	local ang
	if dir>0 then
		return angle/2
	else
		return (angle+ref)/2--(angle+u.sign(angle)*ref)/2
	end
end

--[[
x y
tx = x/2 ty
tx*tx + ty*ty = x*x + y*y
x*x/4 + ty*ty = x*x + y*y
ty2 = 3/4*x2 + y2
ty = raiz ( 3/4*x2 + y2 )
]]

function Ball:draw()
	love.graphics.setColor(self.color)
	love.graphics.circle("fill",self.x,self.y,self.radius,100)
end

return Ball