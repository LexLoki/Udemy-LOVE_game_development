local utils = {
	
	sign = function(num)
		return num>=0 and 1 or -1
	end,

	mag = function(vector)
		return math.sqrt(vector.x*vector.x+vector.y*vector.y)
	end,

	angle = function(vector)
		return math.atan(vector.y/vector.x)
	end,

	absangle = function(angle)
		return angle>0 and angle or math.pi*2+angle
	end,

	vector = function(angle,mag)
		return {x=math.cos(angle)*mag,y=math.sin(angle)*mag}
	end,

	rotate = function(vector,angle)
		local cos,sin = math.cos(angle), math.sin(angle)
		return {x=cos*vector.x+sin*vector.y,y=cos*vector.y-sin*vector.x}
	end

	--vectorToAngle()
}

return utils