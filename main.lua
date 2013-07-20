
--appelé au chargement du fichier puis update, draw, update, draw ....
function love.load()
	-- import le fichier perso.lua
	perso = require("perso")
	toto = perso.new()
	x = 0
	y = 0
	speed = 10
	testSpeech = false
end

--dt le temps passé en seconde
function love.update(dt)
	perso.update(dt)
end

function love.draw()
	perso.draw()
	if testSpeech then
		printSomeSquareSpeech("my name is : "..toto.name)
	end
end

function love.keypressed(key, unicode)
	if key == "a" then
		testSpeech = true
	end
end

function printSomeSquareSpeech(text)
	love.graphics.print(text, x, y)
end
