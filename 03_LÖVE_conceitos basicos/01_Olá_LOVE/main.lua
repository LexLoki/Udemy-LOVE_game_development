--Comando necessario para exibirmos a saida padrao de Lua
io.stdout:setvbuf("no")

function love.load()
	tempo = 0
end

function love.update(dt)
	print(dt)
	meu_dt = dt
	tempo = tempo + dt
end

function love.draw()
	love.graphics.print('Olá!')
	love.graphics.print('Esse é meu primeiro programa com LOVE',20,80)
	love.graphics.print(meu_dt,0,140)
	love.graphics.print(tempo,0,170)
end