
require "init"
require "camera"
require "collision"
require "player"
require "menu"

function love.load()
	Resolution()
	SoundLoad()
	FontLoad()
	PicturesLoad()
	ButtonLoad()
	Player.Load()
end

function love.draw()
	camera:set()
	MenuDraw()
	if EtatJeu == "Play" then
		GroundDraw()
		Player.Draw()
	end
	camera:unset()
end

function love.keyreleased(key)
	Player.AnimReset(key)
end

function love.update(dt)
	SortieEcran()
	Player.Update(dt)
end