function love.load()
	posicao_x = 0
	posicao_y = 0
end

function love.update(dt)
	posicao_x = posicao_x+200*dt
	posicao_y = posicao_y+100*dt
	if posicao_y > love.graphics.getHeight() then
		posicao_y = -50
	end
	if posicao_x > love.graphics.getWidth() then
		posicao_x = -50
	end
end

function love.draw()
	love.graphics.rectangle('fill',posicao_x,posicao_y,50,50)
end