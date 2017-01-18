local Ball = require "Ball"
local Player = require "Player"

local GameManager = {
}

local checkCollisions, isContact, sign

function GameManager.load()
end

function GameManager.start()
	GameManager.objects = {
		players={
			Player.new(200,400,200,50,100)
		}, 
		balls={
			Ball.new(50,70,{x=400,y=500}),
			Ball.new(100,20,{x=500,y=400})
		}
	}
end

function GameManager.update(dt)
	for i,v in pairs(GameManager.objects) do for j,w in pairs(v) do w:update(dt) end end
	checkCollisions()
end

function checkCollisions()
	for ib,vb in pairs(GameManager.objects.balls) do
		for ip,vp in pairs(GameManager.objects.players) do
			local res,dx,dy = isContact(vb,vp)
			if res then
				local dir = vp.speed>0 and -1 or vp.speed<0 and 1 or 0
				local ax,ay = math.abs(dx),math.abs(dy)
				if ax<ay then
					vb:reflectY(dir)
				else
					vb:reflectX(dir)
				end
				vb.x = vb.lastx
				vp.x = vp.lastx
				vb.y = vb.lasty
				vp.y = vp.lasty
				--[[
				if isContact(vb,vp) then
					vp.x = vp.lastx
					vp.y = vp.lasty
				end
				]]
				break
			end
		end
	end
end

function isContact(ball, player)
	local dx = ball.x-math.min(math.max(ball.x,player.x-player.width/2),player.x+player.width/2)
	local dy = ball.y-math.min(math.max(ball.y,player.y-player.height/2),player.y+player.height/2)
	return dx*dx+dy*dy < ball.radius*ball.radius,dx,dy
end

function GameManager.draw()
	for i,v in pairs(GameManager.objects) do for j,w in pairs(v) do w:draw() end end
end

return GameManager