-- definicao de parte
--
-- x
-- y

local snake = {}
local size
local parts
local time
local update_time = 0.2
local dir
local dir_id
local next_id
local can_move
local color = {0,0,255}

local prize
local spawnPrize

function snake.load(bodySize)
	size = bodySize
	parts = {}
	time = 0
	dir = {x=1,y=0}
	parts[1] = {x=4,y=2}
	parts[2] = {x=3,y=2}
	parts[3] = {x=2,y=2}
	dir_id = 'r'
	next_id = 'r'
	prize = {x=5,y=5}
	snake.score = 0
end

function snake.headPos()
	return parts[1]
end

function snake.update(dt)
	time = time+dt
	if time>update_time then
		time = 0
		dir_id = next_id
		local v,i
		local dest = {x=parts[1].x+dir.x,y=parts[1].y+dir.y}
		for i=#parts,2,-1 do
			parts[i].x = parts[i-1].x
			parts[i].y = parts[i-1].y
			if parts[i].x == dest.x and parts[i].y == dest.y then
				return false
			end
		end
		parts[1] = dest
		v = dest
		if prize and v.x == prize.x and v.y == prize.y then
			spawnPrize()
			audio.playBeep()
			snake.grow()
		end
	end
	return true
end

function spawnPrize()
	local rand = love.math.random(1,225-#parts)
	local count = 0
	local grid = {}
	for i=0,14 do
		grid[i] = {}
		for j=0,14 do
			grid[i][j] = true
		end
	end
	for i,v in ipairs(parts) do
		grid[v.x][v.y] = false
	end
	for i=0,14 do for j=0,14 do
		if grid[i][j] then
			count = count+1
			if count == rand then
				prize = {x=i,y=j}
				return
			end
	end end end
	--prize = {x=love.math.random(0,10),y=love.math.random(0,10)}
end

function snake.grow()
	local last = parts[#parts]
	table.insert(parts,{x=last.x,y=last.y})
	snake.score = snake.score + 1
end

function snake.keypressed(key)
	if key=='left' then
		if dir_id ~= 'r' then
			next_id = 'l'
			dir = {x=-1,y=0}
		end
	elseif key=='right' then
		if dir_id ~= 'l' then
			next_id = 'r'
			dir = {x=1,y=0}
		end
	elseif key=='up' then
		if dir_id ~= 'd' then
			next_id = 'u'
			dir = {x=0,y=-1}
		end
	elseif key=='down' then
		if dir_id ~= 'u' then
			next_id = 'd'
			dir = {x=0,y=1}
		end
	end
end

function snake.draw(origin)
	local s = size*0.95
	for _,v in pairs(parts) do
		love.graphics.setColor(255,255,255)
		--love.graphics.rectangle('line', origin.x + v.x*size, origin.y + v.y*size, size, size)
		love.graphics.setColor(color)
		love.graphics.rectangle('fill', origin.x + v.x*size+(size-s)/2, origin.y + v.y*size+(size-s)/2, s, s,size/5,size/5)
	end
	if prize then
		love.graphics.setColor(255,255,0)
		love.graphics.circle('fill', origin.x + (prize.x+0.5)*size,origin.y + (prize.y+0.5)*size,size/2)
		--love.graphics.rectangle('fill',origin.x + prize.x*size,origin.y + prize.y*size,size,size)
	end
end


return snake