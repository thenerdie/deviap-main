-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): Sanjay-B(Sanjay)

-- This is the actual start file. (../core/dashboard/main.lua) is still enforced so, we're forced to use it. 

-- Essential Debug Utilities

-- If Tevgit is overridden
if core.dev.localTevGit then
    require("tevgit:source/application/utilities/debug/output.lua")
    require("tevgit:source/application/utilities/debug/keybinds.lua")
end

-- List of stuff that updates
require("tevgit:source/application/updater/main.lua")