-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): utrain

-- This file lazy-loads our modules that we have made. Enterprise grade, of course.

local globalStringSubstition = string.gsub
local stringReplacementForPeriod = "tevgit:source/libraries/"
local errorMessageIfModuleFailsToLoad = "You either misnamed the library or you forgot './' like a functional programmer."
local regex = "^%."

local requireModule = function(moduleName)
	return require(moduleName)	
end
local errorIfModuleFailsToLoad = function(msg)
	error(msg, 3)
end

local librariesRelativePath =
{
	--libraryName = "./..."
	UI = "./UI/main.lua"
}

return function(libraryName) return require(librariesRelativePath[libraryName]:gsub(regex, stringReplacementForPeriod)) or errorIfModuleFailsToLoad(errorMessageIfModuleFailsToLoad) end
