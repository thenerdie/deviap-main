local pingScale = 300
local downloadScale = 1024 * 5
local uploadScale = 1024 * 5

return function()
    local main = core.construct("guiFrame", {
        size = guiCoord(0, 250, 0, 200),
        position = guiCoord(1, -250, 1, -260),
        strokeAlpha = 0.5
    })

    local container = core.construct("guiFrame", {
        parent = main,
        size = guiCoord(1, 0, 1, -100),
        position = guiCoord(0, 0, 0, 0),
        strokeAlpha = 0.5
    })

    if _TEV_VERSION_MINOR == 24 and _TEV_VERSION_PATCH < 3 then
        core.construct("guiTextBox", {
            parent = container,
            size = guiCoord(0.8, 0, 0.8, 0),
            position = guiCoord(0.1, 0, 0.1, 0),
            backgroundAlpha = 0,
            textAlign = "middle",
            textColour = colour(0.5, 0, 0),
            textSize = 16,
            text = "Network stats are not stable on your version. 0.24.3 is required.",
            textMultiline = true,
            textWrap = true
        })
        return main
    end

    local pingContainer = core.construct("guiFrame", {
        parent = container,
        size = guiCoord(1, -40, 1, -10),
        position = guiCoord(0, 0, 0, 5),
        backgroundAlpha = 0,
        clip = true
    })

    local pingLabel = core.construct("guiTextBox", {
        parent = container,
        size = guiCoord(0, 32, 0, 12),
        backgroundAlpha = 0,
        textAlign = "middleRight",
        textColour = colour(1, 0, 0),
        textSize = 12
    })

    local receivedContainer = core.construct("guiFrame", {
        parent = container,
        size = guiCoord(1, -50, 1, -10),
        position = guiCoord(0, 0, 0, 5),
        backgroundAlpha = 0,
        clip = true
    })

    local receivedLabel = core.construct("guiTextBox", {
        parent = container,
        size = guiCoord(0, 45, 0, 12),
        backgroundAlpha = 0,
        textAlign = "middleRight",
        textColour = colour(0, 0.5, 0),
        textSize = 12
    })

    local sentContainer = core.construct("guiFrame", {
        parent = container,
        size = guiCoord(1, -50, 1, -10),
        position = guiCoord(0, 0, 0, 5),
        backgroundAlpha = 0,
        clip = true
    })

    local sentLabel = core.construct("guiTextBox", {
        parent = container,
        size = guiCoord(0, 45, 0, 12),
        backgroundAlpha = 0,
        textAlign = "middleRight",
        textColour = colour(0, 0, 0.5),
        textSize = 12
    })
    
    local statOutput = core.construct("guiTextBox", {
        parent = main,
        size = guiCoord(1, -10, 0, 100),
        position = guiCoord(0, 5, 1, -95),
        backgroundAlpha = 0,
        textAlign = "topLeft",
        textColour = colour(0, 0, 0),
        textSize = 14,
        text = "",
        textMultiline = true,
        textWrap = true
    })

    spawn(function()
        local lastPing = -1
        local lastReceive = 0
        local lastSend = 0

        -- Needs reworked
        while sleep(0.5) do
            local stats = core.networking:getStats()

            pingLabel.text = stats.lastPing .. "ms"
            pingLabel.position = guiCoord(1.0, -35, math.min(1 - (stats.lastPing / pingScale), 1), -13)

            local newLine = core.construct("guiLine", {
                parent = pingContainer,
                pointA = guiCoord(1.0, 0, 1 - (lastPing / pingScale), -1),
                pointB = guiCoord(1.1, 0, 1 - (stats.lastPing / pingScale), -1),
                lineColour = colour(1, 0, 0)
            })
            lastPing = stats.lastPing

            local pingChildren = pingContainer.children
            for i,v in pairs(pingChildren) do
                core.tween:begin(v, 0.5, {
                    pointA = v.pointA - guiCoord(0.1, 0, 0, 0),
                    pointB = v.pointB - guiCoord(0.1, 0, 0, 0)
                }, "linear")
                if #pingChildren == 12 and i == 1 then
                    v:destroy()
                end
            end

            receivedLabel.text = string.format("%.2f kb-i", stats.lastSecondMessageBytesReceived/1024)
            receivedLabel.position = guiCoord(1.0, -50, math.min(1 - (stats.lastSecondMessageBytesReceived / downloadScale), 1), -13)

            local newLine = core.construct("guiLine", {
                parent = receivedContainer,
                pointA = guiCoord(1.0, 0, 1 - (lastReceive / downloadScale), -1),
                pointB = guiCoord(1.1, 0, 1 - (stats.lastSecondMessageBytesReceived / downloadScale), -1),
                lineColour = colour(0, 0.5, 0)
            })
            lastReceive = stats.lastSecondMessageBytesReceived

            local receivedChildren = receivedContainer.children
            for i,v in pairs(receivedChildren) do
                core.tween:begin(v, 0.5, {
                    pointA = v.pointA - guiCoord(0.1, 0, 0, 0),
                    pointB = v.pointB - guiCoord(0.1, 0, 0, 0)
                }, "linear")
                if #receivedChildren == 12 and i == 1 then
                    v:destroy()
                end
            end

            sentLabel.text = string.format("%.2f kb-o", stats.lastSecondMessageBytesSent/1024)
            sentLabel.position = guiCoord(1.0, -50, math.min(1 - (stats.lastSecondMessageBytesSent / downloadScale), 1), -13)

            local newLine = core.construct("guiLine", {
                parent = sentContainer,
                pointA = guiCoord(1.0, 0, 1 - (lastSend / downloadScale), -1),
                pointB = guiCoord(1.1, 0, 1 - (stats.lastSecondMessageBytesSent / downloadScale), -1),
                lineColour = colour(0, 0, 0.5)
            })
            lastSend = stats.lastSecondMessageBytesSent

            local sentChildren = sentContainer.children
            for i,v in pairs(sentChildren) do
                core.tween:begin(v, 0.5, {
                    pointA = v.pointA - guiCoord(0.1, 0, 0, 0),
                    pointB = v.pointB - guiCoord(0.1, 0, 0, 0)
                }, "linear")
                if #sentChildren == 12 and i == 1 then
                    v:destroy()
                end
            end

            statOutput.text = "Ping Avg: " .. stats.averagePing .. "ms\n" ..
                "Lowest Ping: " .. stats.lowestPing .. "ms\n" ..
                "Last Ping: " .. stats.lastPing .. "ms\n" ..
                "---------\n" ..
                "1s Packet Loss: " .. stats.packetlossLastSecond .. "\n" ..
                "Packet Loss: " .. stats.packetlossTotal .. "\n" ..
                "Send Buffer: " .. stats.messagesInSendBuffer
        end
    end)

    return main
end