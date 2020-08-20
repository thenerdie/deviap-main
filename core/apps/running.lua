-- This script is ran when the user is running a shared app

local disclaimer = core.construct("guiTextBox", {
    parent = core.coreInterface,
    size = guiCoord(0, 75, 0, 18),
    position = guiCoord(0, 10, 1, -28),
    text = "User Content",
    textSize = 14,
    textColour = colour(0, 0, 0),
    textAlign = "middle",
    textFont = "tevurl:fonts/openSansSemiBold.ttf",
    strokeRadius = 2,
    dropShadowAlpha = 0.15,
    strokeAlpha = 0.05
})

disclaimer:on("mouseLeftUp", function()
    core.apps:reload()
end)