
Reso = {
	Width,
	Height,
	Scale
}

function Resolution()
	-- Met l'écran dans la résolution optimale --
	Modes = love.graphics.getModes()
	table.sort(Modes, function(a, b) return a.width * a.height > b.width * b.height end)
	Reso.Height = Modes[1].height
	Reso.Width = Modes[1].width
	love.graphics.setMode(Reso.Width , Reso.Height, true, false, 0 )
	
	Diagonale = math.sqrt(Reso.Height * Reso.Height + Reso.Width * Reso.Width)
	Default = math.sqrt(1366 * 1366 + 768 * 768)
   
	-- calcule de la taille des images en fonction de la résolution --
	Reso.Scale = Diagonale / Default
end

function PicturesLoad()
	Ground = love.graphics.newImage('pictures/Ground.png')
end

function GroundDraw()
	love.graphics.draw(Ground, 0, 0, 0, Reso.Scale, Reso.Scale)
end