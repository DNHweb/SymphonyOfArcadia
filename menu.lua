
EtatJeu = "Menu"

function ButtonLoad()
	Button = {
		Main = {
			New = {On = NewOn, Off = NewOff, x = love.graphics.getWidth()/2 - NewOn:getWidth()/2, y = love.graphics.getHeight() - 200, Width = 224, Height = 35, Id = "NewGame"},
			Quit = {On = QuitOn, Off = QuitOff, x = love.graphics.getWidth()/2 - QuitOn:getWidth()/2, y = love.graphics.getHeight() - 100, Width = 106, Height = 35, Id = "Quit"}
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

	if EtatJeu == "Menu" then
		love.graphics.draw(MainTitle, 0, 0, 0, Reso.Scale, Reso.Scale)
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
					elseif v.Id == "Quit" then
						love.event.push("quit")
					end
				end
			end
		end
	end
	
end