
function love.load()

end

function love.update(dt)

end

function love.draw()
	love.graphics.setColor(34, 217, 90)
	love.graphics.rectangle('fill', 40, 30, 200, 100)
	love.graphics.rectangle('line', 240, 30, 200, 100)
	love.graphics.setColor(200,0,0)
	love.graphics.circle('fill', 0, 0, 30)
	love.graphics.circle('fill', 240, 180, 30)

	love.graphics.line(2,2,300,200,150,450,400,500,700,300)
end