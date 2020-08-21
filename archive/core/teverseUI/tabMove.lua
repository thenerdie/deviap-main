local new = function(targetObject, movingObject)
	--[[
		@description
			Given a targetObject, whenever the user holds down and move,
			it will also move another object. It will move by the delta
			of the mouse.
		@parameter
			guiObject, targetObject
			guiObject, movingObject
		@return
			function, destructor
	]]

	local debounce = false
	local onMouseLeftDown = targetObject:on("mouseLeftDown", function(startingMousePosition)
		if debounce then return end
		debounce = true

		local offset = startingMousePosition - targetObject.absolutePosition
		local onMove
		local onRelease

		onMove = core.input:on("mouseMoved", function()
			local mousePosition = core.input.mousePosition
			movingObject.position = guiCoord(0, mousePosition.x - offset.x, 0, mousePosition.y - offset.y)
		end)

		onRelease = core.input:on("mouseLeftUp", function()
			core.disconnect(onMove)
			core.disconnect(onRelease)
			debounce = false
		end)
	end)

	return function() core.disconnect(onMouseLeftDown) end
end


return new