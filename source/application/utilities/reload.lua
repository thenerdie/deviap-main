-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): Sanjay-B(Sanjay)

-- Temporary file. Force reloads Deviap. 
core.input:on("keyDown", function(key)
    if key == "KEY_TAB" then core.apps:reset() end
end)