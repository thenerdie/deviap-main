--Generate the UI
local container = core.construct("guiFrame", {
	parent = core.coreInterface,
	size = guiCoord(0,
		math.max(core.coreInterface.absoluteSize.x / 3, 100),
		0,
		math.max(core.coreInterface.absoluteSize.y / 3, 200));
	position = guiCoord(0, 20, 0, 20);
	visible = false;
	strokeWidth = 2;
	strokeColour = colour(0.75,0.75,0.75);
	strokeAlpha = 1;
	strokeRadius = 2;
})

local topBar = core.construct("guiFrame", {
	parent = container;
	size = guiCoord(1, 0, 0, 20);
	backgroundColour = colour(0.75, 0.75, 0.75);
})

local title = core.construct("guiTextBox", {
	parent = topBar;
	size = guiCoord(1, -24, 1, 0);
	position = guiCoord(0, 4, 0, 0);
	backgroundAlpha = 0;
	active = false;
	textSize = 20;
	text = "Console"
})

local leave = core.construct("guiFrame", {
	parent = topBar;
	size = guiCoord(0, 14, 0, 14);
	position = guiCoord(1, -16, 0, 2);
	backgroundColour = colour(0.70, 0.35, 0.35);
	strokeRadius = 14
})

local clear = core.construct("guiTextBox", {
	parent = topBar;
	text = "C";
	textColour =  colour(0.5, 0.5, 0.5);
	textAlign = "middle";
	textSize = 15;
	size = guiCoord(0, 14, 0, 14);
	position = guiCoord(1, -32, 0, 2);
	backgroundColour = colour(0.8, 0.8, 0.8);
	strokeRadius = 14
})

local commandLine = require("devgit:core/teverseUI/commandLine.lua")
commandLine.parent = container
commandLine.size = guiCoord(1, 0, 0, 20)
commandLine.position = guiCoord(0, 0, 1, -20)

local log = require("devgit:core/teverseUI/log.lua")({
	parent = container;
	size = guiCoord(1, 0, 1, -40);
	position = guiCoord(0, 0, 0, 20);
	scrollbarRadius = 0.01;
	scrollbarWidth = 4;
	scrollbarColour = colour(.8,.8,.8);
})

--Allow users to move and resize the console
require("devgit:core/teverseUI/resize.lua")(container)
require("devgit:core/teverseUI/tabMove.lua")(topBar, container)

--Leave console
leave:on("mouseLeftDown", function()
	container.visible = false
end)

--Clear console
clear:on("mouseLeftDown", log.clear)

--Add new logs when a print occurs.
core.debug:on("print", function(printOut)
	log.add(os.date("%H:%M:%S", os.time()) .. ": " .. printOut:gsub("\t", ""))
end)

container:on("changed", log.reload)

--Add any missed debug logs.
for _,v in pairs(core.debug:getOutputHistory()) do
	log.add(os.date("%H:%M:%S", v.time).. ": " .. v.message:gsub("\t", ""))
end

return container