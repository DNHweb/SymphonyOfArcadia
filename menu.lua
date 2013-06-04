
EtatJeu = "Menu"

function ButtonLoad()
	Button = {
		Main = {
			New = {On = NewOn, Off = NewOff, x = love.graphics.getWidth()/2 - NewOn:getWidth()/2, y = love.graphics.getHeight() - 200, Width = 224, Height = 35, Id = "NewGame"},
			Load = {On = LoadOn, Off = LoadOff, x = love.graphics.getWidth()/2 - LoadOn:getWidth()/2, y = love.graphics.getHeight() - 150, Width = 224, Height = 35, Id = "LoadGame"},
			Quit = {On = QuitOn, Off = QuitOff, x = love.graphics.getWidth()/2 - QuitOn:getWidth()/2, y = love.graphics.getHeight() - 100, Width = 106, Height = 35, Id = "QuitGame"}
		}
	}
end

function ButtonDraw(off, on, x, y, w, h)
	local px = love.mouse.getX()
	local py = love.mouse.getY()
	if px > x and px < x + w and py > y and  py < y + h then
		love.graphics.draw(on, x, y)
	else
		love.graphics.draw(off, x, y)
	end
end

function MenuDraw()

	-- love.audio.play(MainTheme) fait planter le jeu... WTF ?!
	if EtatJeu == "Menu" then
		love.graphics.draw(MainTitle, 0, 0, 0, Reso.Scale, Reso.Scale)
		love.graphics.setColor(51, 59, 81, 150)
		love.graphics.rectangle("fill", love.graphics.getWidth()/2 - 150, love.graphics.getHeight() - 220, 300, 180)
		love.graphics.reset()
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", love.graphics.getWidth()/2 - 150, love.graphics.getHeight() - 220, 300, 180)
		love.graphics.reset()
		for k, v in pairs(Button.Main) do
			ButtonDraw( v.Off, v.On, v.x, v.y, v.Width, v.Height, x, y )
		end
	end
end

function love.mousepressed(x, y, button)

	if button == "l" then
		if EtatJeu == "Menu" then
			for k, v in pairs(Button.Main) do
				if x > v.x and x < v.x + v.Width and y > v.y and  y < v.y + v.Height then
					if v.Id == "NewGame" then
						EtatJeu = "Play"
					elseif v.Id == "LoadGame" then
						
					elseif v.Id == "QuitGame" then
						love.event.push("quit")
					end
				end
			end
		end
	end
	
end