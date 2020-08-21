local loadingText = core.construct("guiTextBox", {
    parent = core.interface,
    size = guiCoord(2, 0, 2, 0),
    position = guiCoord(-0.5, 0, -0.5, 0),
    backgroundColour = colour.black(),
    textColour = colour.white(),
    text = "Deviap",
    textAlign = "middle",
    textSize = 38,
    textFont = "tevurl:fonts/moskUltraBold.ttf",
    zIndex = 2000
})

local ui = require("devgit:core/dashboard/ui.lua")
ui.setup()

loadingText:destroy()