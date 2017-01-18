local Player = {
	color = {255,255,255}
}

function Player.new(x,y,width,height)
	local self = {x=x,y=y,width=width,height=height,_speed=400,speed=400,keys={right='right',left='left'}}
	self.lastx = x
	self.lasty = y
	setmetatable(self, {__index=Player})
	return self
end

function Player:update(dt)
	self.lastx = self.x
	self.lasty = self.y
	local k = self.keys
	if k then
		local dir
		if love.keyboard.isDown(k.right) then
			dir = 1
		elseif love.keyboard.isDown(k.left) then
			dir = -1
		else
			dir = 0
		end
		self:setDirection(dir)
	end
	self.x = self.x+self.speed*dt
end

function Player:setDirection(dir)
	self.speed = self._speed*dir
end

function Player:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle('fill',self.x-self.width/2,self.y-self.height/2,self.width,self.height)
end

return Player