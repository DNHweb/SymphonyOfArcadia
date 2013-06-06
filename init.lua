
-- +----------------------------+
-- | Initialition des variables |
-- +----------------------------+
Reso = {
	Width,
	Height,
	Scale
}

-- +-------------------------------+
-- | Initialition de la résolution |
-- +-------------------------------+
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

-- +-----------------------+
-- | Initialition des sons |
-- +-----------------------+
function SoundLoad()
	MainTheme = love.audio.newSource("sounds/MainTheme.mp3", "stream")
	MainTheme:setVolume(0.25)
	MainTheme:rewind()
end

-- +-------------------------+
-- | Initialition des images |
-- +-------------------------+
function PicturesLoad()
	-- Element du menu principal --
	MainTitle = love.graphics.newImage('pictures/SoA.png')
	NewOn = love.graphics.newImage('pictures/menus/NewOn.png')
	NewOff = love.graphics.newImage('pictures/menus/NewOff.png')
	LoadOn = love.graphics.newImage('pictures/menus/LoadOn.png')
	LoadOff = love.graphics.newImage('pictures/menus/LoadOff.png')
	QuitOn = love.graphics.newImage('pictures/menus/QuitOn.png')
	QuitOff = love.graphics.newImage('pictures/menus/QuitOff.png')
	SaveOn = love.graphics.newImage('pictures/menus/EmptySaveOn.png')
	SaveOff = love.graphics.newImage('pictures/menus/EmptySaveOff.png')
	ReturnOn = love.graphics.newImage('pictures/menus/ReturnOn.png')
	ReturnOff = love.graphics.newImage('pictures/menus/ReturnOff.png')
	
	-- Element de decor --
	Ground = love.graphics.newImage('pictures/Ground.png')
end

-- +------------------------+
-- | Initialition des menus |
-- +------------------------+
function MenuLoad()
	
end


function GroundDraw()
	love.graphics.draw(Ground, 0, 0, 0, Reso.Scale, Reso.Scale)
end