local libsLocations =
{
	--libName = "./..."
	UI = "./UI/main.lua"
}

return function(libName)
	return require(libsLocations[libName]:gsub("^", "tevgit:source/libraries/"))
end
