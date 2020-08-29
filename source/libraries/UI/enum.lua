-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): KISPERAL

-- PROVIDES A SINGLETON CLASS TO CREATE ENUMS, AND RESOLVE THOSE ENUMS

function string.split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
    end
    return t
end

local lastValue = 0

local enumerable = {}

enumerable.tree = {}

local function recursiveIterate(table, callback)
    for i, v in pairs(table) do
        if type(v) == "table" then 
            recursiveIterate(v, callback)
        else
            callback(i, v)
        end
    end
end

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

function enumerable:resolveValue(value)
    local t = type(value)
    local ret = nil
    recursiveIterate(self.tree, function(index, obj)
        if (t == "string") and (index == value) or (obj == value) then
            ret = (t == "string") and obj or index
        end
    end)
    return ret
end

return enumerable