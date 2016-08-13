

local Ball = {}

Ball.radius = 20
Ball.color = {0,255,255}

function Ball.new(x,y,speed)
	local self = {
		x=x, y=y, speed = speed
	}
	setmetatable(self, {__index=Ball})
	return self
end

function Ball:update(dt)
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
end

function Ball:draw()
	love.graphics.setColor(self.color)
	love.graphics.circle("fill",self.x,self.y,self.radius,100)
end

return Ball