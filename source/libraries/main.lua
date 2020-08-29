local libsLocations =
{
	--libName = "./..."
	UI = "./UI/main.lua"
}

return function(libName)
	return require(libName:gsub("^", "tevgit:source/libraries/"))
end
