
-- +----------------------------+
-- | Initialition des variables |
-- +----------------------------+
Reso = {
	Width,
	Height,
	Scale
}

-- +-------------------------------+
-- | Initialition de la r�solution |
-- +-------------------------------+
function Resolution()
	-- Met l'�cran dans la r�solution optimale --
	Modes = love.graphics.getModes()
	table.sort(Modes, function(a, b) return a.width * a.height > b.width * b.height end)
	Reso.Height = Modes[1].height
	Reso.Width = Modes[1].width
	love.graphics.setMode(Reso.Width , Reso.Height, true, false, 0 )
	
	Diagonale = math.sqrt(Reso.Height * Reso.Height + Reso.Width * Reso.Width)
	Default = math.sqrt(1366 * 1366 + 768 * 768)
   
	-- calcule de la taille des images en fonction de la r�solution --
	Reso.Scale = Diagonale / Default
end

-- +--------------------------+
-- | Initialition des polices |
-- +--------------------------+
function FontLoad()

end

-- +-------------------------+
-- | Initialition des images |
-- +-------------------------+
function PicturesLoad()
	MainTitle = love.graphics.newImage('pictures/SoA.png')
	Ground = love.graphics.newImage('pictures/Ground.png')
	
	NewOn = love.graphics.newImage('pictures/menus/NewOn.png')
	NewOff = love.graphics.newImage('pictures/menus/NewOff.png')
end

-- +------------------------+
-- | Initialition des menus |
-- +------------------------+
function MenuLoad()
	
end


function GroundDraw()
	love.graphics.draw(Ground, 0, 0, 0, Reso.Scale, Reso.Scale)
end