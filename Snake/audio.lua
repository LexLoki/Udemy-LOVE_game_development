
audio = {}
local source

function audio.load()
	source = love.audio.newSource('beep.mp3')
end

function audio.playBeep()
	love.audio.play(source)
end