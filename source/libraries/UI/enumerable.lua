local lastValue = 0

local enumerable = {}

enumerable.tree = {}

function enumerable:newEnum(directory, name, value)
    local curDirectory = self.tree

    for _, dirName in pairs(string.split(directory, "/")) do
        if curDirectory[dirName] == nil then
            curDirectory[dirName] = {}
        end
        curDirectory = curDirectory[dirName]
    end
    curDirectory[name] = value or (lastValue+1)
end

return enumerable
