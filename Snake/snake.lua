-- definicao de parte
--
-- x
-- y

local snake = {}
local parts
local size = 32
local time
local update_time = 0.2
local dir
local dir_id
local next_id
local can_move
local color = {0,0,255}

local prize

function snake.load()
	parts = {}
	time = 0
	dir = {x=1,y=0}
	parts[1] = {x=4,y=2}
	parts[2] = {x=3,y=2}
	parts[3] = {x=2,y=2}
	dir_id = 'r'
	next_id = 'r'
	prize = {x=5,y=5}
end

function snake.update(dt)
	time = time+dt
	if time>update_time then
		time = 0
		dir_id = next_id
		local v,i
		local dest = {x=parts[1].x+dir.x,y=parts[1].y+dir.y}
		if dest.x < 0 or dest.y < 0 or dest.x >= 15 or dest.y >= 15 then
			return false
		end
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
			prize = {x=love.math.random(0,10),y=love.math.random(0,10)}
			audio.playBeep()
			snake.grow()
		end
	end
	return true
end

function snake.grow()
	local last = parts[#parts]
	table.insert(parts,{x=last.x,y=last.y})
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
	for i,v in ipairs(parts) do
		love.graphics.setColor(255,255,255)
		love.graphics.rectangle('line', origin.x + v.x*size, origin.y + v.y*size, size, size)
		love.graphics.setColor(color)
		love.graphics.rectangle('fill', origin.x + v.x*size, origin.y + v.y*size, size, size)
	end
	if prize then
		love.graphics.setColor(255,255,0)
		love.graphics.rectangle('fill',origin.x + prize.x*size,origin.y + prize.y*size,size,size)
	end
end


return snake