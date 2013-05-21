
require "init"
require "camera"
require "collision"
require "player"

function love.load()
	Resolution()
	PicturesLoad()
	Player.Load()
end

function love.draw()
	camera:set()
	GroundDraw()
	Player.Draw()
	camera:unset()
end

function love.keyreleased(key)
	Player.AnimReset(key)
end

function love.update(dt)
	SortieEcran()
	Player.Update(dt)
end