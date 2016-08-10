local snake = require 'snake'
require 'audio'

local cell_size = 32
local grid_size = {x=15,y=15}
local world_size = {width = cell_size*grid_size.x,height = cell_size*grid_size.y}
local origin

local checkCollision
local gameIsOver

function love.load()
	love.graphics.setNewFont(14)
	audio.load()
	snake.load(cell_size)
	origin = {x=0,y=0}
	love.window.setMode(world_size.width,world_size.height)
	gameIsOver = false
end

function love.update(dt)
	if not gameIsOver then
		if not snake.update(dt) or checkCollision() then
			gameIsOver = true
		end
	end
end

function love.keypressed(key)
	if gameIsOver then
		if key=='return' then
			snake.load(cell_size)
			gameIsOver = false
		end
	else
		snake.keypressed(key)
	end
end

function love.draw()
	local w,h = love.graphics.getDimensions()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle('fill',0,0,w,h)
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle('fill',origin.x,origin.y,world_size.width,world_size.height)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle('line',origin.x,origin.y,world_size.width,world_size.height)
	snake.draw(origin)
	love.graphics.print('Score: '..snake.score,10,10)
	if gameIsOver then
		love.graphics.setColor(0,0,0,160)
		love.graphics.rectangle('fill',0,0,w,h)
		love.graphics.setColor(255,255,255)
		love.graphics.setNewFont(40)
		love.graphics.printf('Game over!\nYour score: '..snake.score,0,h/4,w,'center')
		love.graphics.setNewFont(14)
	end
end

function checkCollision()
	local p = snake.headPos()
	if p.x<0 or p.y<0 or p.x>=grid_size.x or p.y>=grid_size.y then
		return true
	end
	return false
end