
EtatJeu = "Menu"

function ButtonLoad()
	Button = {
		Main = {
			New = {On = NewOn, Off = NewOff, x = love.graphics.getWidth()/2 - NewOn:getWidth()/2, y = love.graphics.getHeight() - 200, Width = 224, Height = 35, Id = "NewGame"},
			Load = {On = LoadOn, Off = LoadOff, x = love.graphics.getWidth()/2 - LoadOn:getWidth()/2, y = love.graphics.getHeight() - 150, Width = 224, Height = 35, Id = "LoadGame"},
			Quit = {On = QuitOn, Off = QuitOff, x = love.graphics.getWidth()/2 - QuitOn:getWidth()/2, y = love.graphics.getHeight() - 100, Width = 106, Height = 35, Id = "QuitGame"}
		},
		NewGame = {
			Save1 = {On = SaveOn, Off = SaveOff, x = love.graphics.getWidth()/2 - SaveOn:getWidth()/2, y = love.graphics.getHeight()/2 - 100, Width = 365, Height = 35, Id = "Save1"},
			Save2 = {On = SaveOn, Off = SaveOff, x = love.graphics.getWidth()/2 - SaveOn:getWidth()/2, y = love.graphics.getHeight()/2, Width = 265, Height = 35, Id = "Save2"},
			Save3 = {On = SaveOn, Off = SaveOff, x = love.graphics.getWidth()/2 - SaveOn:getWidth()/2, y = love.graphics.getHeight()/2 + 100, Width = 265, Height = 35, Id = "Save3"},
			ReturnMain = {On = ReturnOn, Off = ReturnOff, x = love.graphics.getWidth()/2 - ReturnOn:getWidth()/2, y = love.graphics.getHeight()/2 + 200, Width = 106, Height = 30, Id = "ReturnMain"}
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
	if EtatJeu == "Save" then
		love.graphics.draw(MainTitle, 0, 0, 0, Reso.Scale, Reso.Scale)
		love.graphics.setColor(51, 59, 81, 150)
		love.graphics.rectangle("fill", love.graphics.getWidth()/2 - 300, love.graphics.getHeight()/2 - 130, 600, 400)
		love.graphics.reset()
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", love.graphics.getWidth()/2 - 300, love.graphics.getHeight()/2 - 130, 600, 400)
		love.graphics.reset()
		for k, v in pairs(Button.NewGame) do
			ButtonDraw( v.Off, v.On, v.x, v.y, v.Width, v.Height, x, y )
		end
	end
	if EtatJeu == "Create" then
		love.graphics.draw(MainTitle, 0, 0, 0, Reso.Scale, Reso.Scale)
		love.graphics.setColor(51, 59, 81, 150)
		love.graphics.rectangle("fill", 50, 50, love.graphics.getWidth() - 100, love.graphics.getHeight() - 100)
		love.graphics.reset()
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", 50, 50, love.graphics.getWidth() - 100, love.graphics.getHeight() - 100)
		love.graphics.reset()
	end
end

function love.mousepressed(x, y, button)

	if button == "l" then
		if EtatJeu == "Menu" then
			for k, v in pairs(Button.Main) do
				if x > v.x and x < v.x + v.Width and y > v.y and  y < v.y + v.Height then
					if v.Id == "NewGame" then
						EtatJeu = "Save"
					elseif v.Id == "LoadGame" then
						-- On affiche le menu des sauvegardes
					elseif v.Id == "QuitGame" then
						love.event.push("quit")
					end
				end
			end
		end
		if EtatJeu == "Save" then
			for k, v in pairs(Button.NewGame) do
				if x > v.x and x < v.x + v.Width and y > v.y and  y < v.y + v.Height then
					if v.Id == "Save1" then
						-- On vérifie si une sauvegarde existe
						-- Si oui, on l,écrase
						-- sinon, on la créer
						EtatJeu = "Create"
					elseif v.Id == "Save2" then
						-- On vérifie si une sauvegarde existe
						-- Si oui, on l'écrase
						-- sinon, on la créer
						EtatJeu = "Create"	
					elseif v.Id == "Save3" then
						-- On vérifie si une sauvegarde existe
						-- Si oui, on l'écrase
						-- sinon, on la créer
						EtatJeu = "Create"
					elseif v.Id == "ReturnMain" then
						EtatJeu = "Menu"
					end
				end
			end
		end
	end
	
end