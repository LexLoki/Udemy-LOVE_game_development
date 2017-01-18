local gm = require "GameManager"
io.stdout:setvbuf("no")

local isActive = false

function love.load()
	gm.load()
	gm.start()
end

function love.update(dt)
	gm.update(dt)
	if isActive then d:updateText(dt) end
end

function love.mousepressed(...)
	isActive = true
end

function love.draw()
	gm.draw()
	if isActive then d:drawText() end
end