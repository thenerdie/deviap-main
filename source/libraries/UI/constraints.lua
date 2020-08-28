-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): utrain, Ya

-- Constraints using tabs. Some components of this are not implemented. This is not is also not the final interface.

local new = function()
	local public = {}
	public.tabs = { x = {}; y = {} }
	public.anchors = { x = {}; y = {} } -- ez reference

	public.registerRelativeTab = function(axis, tag, relativeTo, min, max, pref, weight)
		--[[
			@description
				Registers a new relative tab.

			@parameters
				string, axis
					Axis of which the new axis will be placed.
				string, tag
					The tag of the tab. Cannot conflict with already existing tags. Used to reference the tab.
				integer, min
					Minimum distance away from a tab it's set relative to.
				integer, [max]
					Maximum distance away from a tab it's relative to. Defaults to min if not defined.
				integer, [pref]
					Preferred distance away from a tab it's relative to. Defaults to min if not defined.
				integer, [weight]
					How much weight is given to this tab (DEPENDS ON RESOLVER USED). Defaults to 1 if not defined.

			@returns
				nil
		]]
	end

	public.registerAnchorTab = function(axis, tag, offset)
		--[[
			@description
				Register an anchor tabs

			@parameters
				string, axis
					Axis of which the new tab will be placed.
				string, tag
					The tag of the tab. Cannot conflict with already existing tags. Used to reference the tab.
				integer, offset
					The offset away from the border.

			@returns
				nil
		]]
	end

	public.pokeTab = function(axis, tag)
		--[[
			@description
				pokey tab haha

			@parameters
				string, axis
					Axis of the tab you wanna poke.
				string, tag
					Tag of the tab you wanna poke.

			@returns
				tab, tab you wanna poke
		]]
	end

	public.removeTab = function(axis, tag)
		--[[
			@description
				UNSAFE: removes tab and returns the tab(s) that was relative to it.

			@parameters
				string, axis
					Axis of tab to remove.
				string, tag
					Tag of the tab to remove.

			@returns
				tab, tab that was relative to the tab removed.
		]]
	end

	public.isSafeToRemove = function(axis, tag)
		--[[
			@description
				UNSAFE: removes tab and returns the tab(s) that was relative to it.

			@parameters
				string, axis
					Axis of tab to remove.
				string, tag
					Tag of the tab to remove.

			@returns
				tab, tab that was relative to the tab removed.
		]]
	end

	public.resolveForAxis = function(axis, maxLength)
		--[[
			@description
				Resolves for the given axis.

			@parameters
				string, axis
					Axis to resolve.
			@returns
				hashmap<string, integer>
					with string being tag of tab and integer being the position.
		]]
	end

	public.resolve = function(maxSize)
			--[[
			@description
				Returns the resolved positions of all of the tabs.

			@returns
				{ x = resolveForAxis("x"); y = resolveForAxis("y") }
		]]
	end

	return public
end

return { new = new }