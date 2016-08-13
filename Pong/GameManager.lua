local Ball = require "Ball"
local Player = require "Player"

local GameManager = {
}


function GameManager.load()
end

function GameManager.start()
	GameManager.objects = {
		players={
			Player.new(200,580,200,50,100)
		}, 
		balls={
			Ball.new(50,70,{x=400,y=500}),
			Ball.new(100,20,{x=500,y=400})
		}
	}
end

function GameManager.update(dt)
	for i,v in pairs(GameManager.objects) do for j,w in pairs(v) do w:update(dt) end end

end

function GameManager.draw()
	for i,v in pairs(GameManager.objects) do for j,w in pairs(v) do w:draw() end end
end

return GameManager