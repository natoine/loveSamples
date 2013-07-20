local perso_mt = {x = 400, y = 300}
local perso = {}

perso.all = {}

function perso.new(name)
	local self = setmetatable({},{__index = perso_mt})
	self.name = name or "georges"
	table.insert(perso.all , self)
	return self
end

function perso.update(dt)
	local i = 1
	while i <= #perso.all do
		local v = perso.all[i]
		if v.purge then
			table.remove(perso.all , i)
		else 
			v:update(dt)
			i = i + 1
		end
	end
end

function perso.draw()
	for i , v in ipairs(perso.all) do
		v:draw()
	end
end

function perso_mt:update(dt)
	if love.keyboard.isDown("left") then
		self.x = self.x - speed * dt
	end
	if love.keyboard.isDown("right") then
		self.x = self.x + speed * dt
	end
	if love.keyboard.isDown("up") then
		self.y = self.y - speed * dt
	end
	if love.keyboard.isDown("down") then
		self.y = self.y + speed * dt
	end
end

function perso_mt:draw()
	--penser à centrer en faisant pos X - hauteur / 2, pos Y - largeur /2
	love.graphics.rectangle("fill", self.x - 50 / 2, self.y - 50 / 2, 50, 50)
end

return perso
