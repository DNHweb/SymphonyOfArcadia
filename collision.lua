
function SortieEcran()
	if Player.Position.x < 0 then
		Player.Position.x = 0
	elseif Player.Position.x > Ground:getWidth() - 20 then
		Player.Position.x = Ground:getWidth() - 20
	end
	if Player.Position.y < 0 then
		Player.Position.y = 0
	elseif Player.Position.y > Ground:getHeight() - 43 then
		Player.Position.y = Ground:getHeight() -  43
	end
end

Cercle = {
	Position = {x, y},
	Rayon = 0
}

function Collision(C1, C2)
	local d2 = (C1.x - C2.x) * (C1.x - C2.x) + (C1.y - C2.y) * (C1.y - C2.y)
	if d2 > (C1.Rayon + C2.Rayon) * (C1.Rayon + C2.Rayon) then
		return false
	else
		return true
	end
end