--- The reason why we need a renderer,
-- is because we need "layers" in a platformer type game
-- so we define a separate object to handle that
-- this will help with efficiency apparantly

local Renderer = {}

local num_of_layers = 5

--- function to create the renderer
function  Renderer:create()
	local renderer = {}

	--- First we wanna create a list of objs we want to draw
	-- so for that:

	-- initialise a multidimational array; ie, a table of 5 layers, with each layer having its own table of objects
	renderer.drawers = {}
	for i = 1, num_of_layers do
		renderer.drawers[i] = {}
	end

	--- obj: the object we want to draw in the given layer
	-- layer: the layer we want to draw the object in
	function renderer:add_renderer(obj, layer)
		-- l = 1 if we don't pass a layer
		local l = layer or 1
		table.insert(self.drawers[l], obj)
	end

	-- the function does that the actual "draw"ing (the draw call)
	function renderer:draw()
		-- iterate through the drawers array, and call the draw function for each obj
		for layer = 1, #self.drawers do
			for draw = 1, #self.drawers[layer] do
				local obj = self.drawers[layer][draw]
				obj:draw()
			end
		end
	end

	return renderer
end

return Renderer