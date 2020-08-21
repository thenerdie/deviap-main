-- Copyright 2020- Teverse
-- This script constructs (or builds) the default in-game chat system on the server

core.networking:on("ChatMessage", function(client, message)
    core.networking:broadcast("ChatMessage", client, message)
end)

--[[
core.networking:on("_clientConnected", function(client)
    core.networking:broadcast("ChatClientAdd", "Server", client.name .. " joined the chat")
end)

core.networking:on("_clientDisconnected", function(client)
    core.networking:broadcast("ChatClientRemoved", "Server", client.name .. " left the chat")
end)
]]--