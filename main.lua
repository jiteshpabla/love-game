local Rend = require("tools/renderer")

renderer = Rend:create()

function draw_text(x, y, text)
	local t = {}

	t.x = x or 0
	t.y = y or 0
	t.text = text or "no text"

	-- this function will just add the object to the "drawers" table
	function t:load()
		renderer:add_renderer(self, 1)
	end

	-- this will be called by the renderer:draw()
	function t:draw()
		love.graphics.print(self.text, self.x, self.y)
	end

	return t
end


function love.load()
	t1 = draw_text(100, 100, "Hello World")

	t1:load()
end

function love.update(dt)
	-- body
end

function love.draw()
	-- by putting this here, we just have to add objects we want to draw using the add_renderer function,
	-- and this will automatically draw everything for us, since it will call the "draw" function of our object
	renderer:draw()

	-- either you can do all of the things in main.lua and renderer.lua or this:
	--love.graphics.print("Hello World", 400, 300)
end