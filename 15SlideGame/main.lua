
local grid = {}
local startGrid, switchHole
local hole
local animationTime = 0.2
local timer=0
local movPiece
local audioSource

function love.load()
	audioSource = love.audio.newSource('SlideEff.mp3')
	love.window.setMode(64*4,64*4)
	love.graphics.setNewFont(40)
	startGrid()
end

function love.update(dt)
	if movPiece then
		timer = timer+dt
		if timer>=animationTime then
			movPiece = nil
		end
	end
end

function love.keypressed(key)
	if movPiece then do return end end
	if key=='left' then
		if hole.col<3 then
			switchHole(1,0)
		end
	elseif key=='right' then
		if hole.col>0 then
			switchHole(-1,0)
		end
	elseif key=='down' then
		if hole.lin>0 then
			switchHole(0,-1)
		end
	elseif key=='up' then
		if hole.lin<3 then
			switchHole(0,1)
		end
	elseif key=='return' then
		startGrid()
	end
end

function switchHole(dirx,diry)
	local c,l = hole.col+dirx,hole.lin+diry
	grid[hole.lin][hole.col] = grid[l][c]
	grid[l][c] = 0
	movPiece = {
		dlin = -diry,
		dcol = -dirx
	}
	hole.lin = l
	hole.col = c
	timer = 0
	if audioSource:isPlaying() then
		audioSource:rewind()
	else
		audioSource:play()
	end
end

function love.draw()
	for i=0,3 do
		for j=0,3 do
			love.graphics.setColor(255,255,255)
			love.graphics.rectangle('fill',64*j,64*i,64,64)
			love.graphics.setColor(0,0,0)
			love.graphics.print(grid[i][j],64*j,64*i)
		end
	end
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle('fill',hole.col*64,hole.lin*64,64,64)
	if movPiece then
		love.graphics.rectangle('fill',(hole.col+movPiece.dcol)*64,(hole.lin+movPiece.dlin)*64,64,64)
		love.graphics.setColor(255,255,255)
		local perc = timer/animationTime
		local px,py = (hole.col+perc*movPiece.dcol)*64, (hole.lin+perc*movPiece.dlin)*64
		love.graphics.rectangle('fill',px,py,64,64)
		love.graphics.setColor(0,0,0)
		love.graphics.print(grid[hole.lin+movPiece.dlin][hole.col+movPiece.dcol],px,py)
	end
	for i=0,4 do
		love.graphics.line(64*i, 0, 64*i, 64*4)
		love.graphics.line(0, 64*i, 64*4, 64*i)
	end
end

function startRandomGrid()
end

function startGrid()
	local list = {}
	for i=0,15 do table.insert(list,i) end
	for i=0,3 do
		grid[i] = {}
		for j=0,3 do
			grid[i][j] = table.remove(list,love.math.random(1,#list))
			if grid[i][j] == 0 then
				hole = {lin=i,col=j}
			end
		end
	end
end