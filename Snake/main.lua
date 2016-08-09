local snake = require 'snake'
require 'audio'

local cell_size = 32
local grid_size = {x=20,y=20}
local world_size = {width = cell_size*grid_size.x,height = cell_size*grid_size.y}
local origin

local checkCollision

function love.load()
	audio.load()
	snake.load(cell_size)
	origin = {x=0,y=0}
	love.window.setMode(world_size.width,world_size.height)
end

function love.update(dt)
	if not snake.update(dt) or checkCollision() then
		snake.load(cell_size)
	end
	
end

function love.keypressed(key)
	snake.keypressed(key)
end

function love.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle('fill',0,0,love.graphics.getDimensions())
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle('fill',origin.x,origin.y,world_size.width,world_size.height)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle('line',origin.x,origin.y,world_size.width,world_size.height)
	snake.draw(origin)
end

function checkCollision()
	local p = snake.headPos()
	if p.x<0 or p.y<0 or p.x>=grid_size.x or p.y>=grid_size.y then
		return true
	end
	return false
end