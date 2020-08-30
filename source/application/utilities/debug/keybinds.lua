-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): Sanjay-B(Sanjay)

-- All keybinds used for debugging internally.

local graphicsDebug = false
core.input:on("keyDown", function(key)

    -- Output Window Enable / Disable
    if key == "KEY_F1" then core.interface:child("outputWindow").visible = not core.interface:child("outputWindow").visible

    -- Hard Reset Application
    elseif key == "KEY_F2" then core.apps:reset()

    -- Prompts Tevgit
    elseif key == "KEY_F3" then core.dev:promptTevGit()

    -- Hard Reload Shaders
    elseif key == "KEY_F4" then core.dev:reloadAllShaders()

    -- Graphics Debug Enable / Disable
    elseif key == "KEY_F5" then graphicsDebug = not graphicsDebug core.graphics:setDebug(graphicsDebug)
    end
end)