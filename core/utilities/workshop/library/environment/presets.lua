-- Copyright 2020- Teverse
-- This script constructs (or builds) the baseline (or default) environment
return {
    default = function()
        core.scene.simulate = true
        core.scene.camera.position = vector3(0, 1, -10)
        core.scene.camera.rotation = quaternion.euler(math.rad(25), 0, 0)

        local light = core.construct("directionalLight", {
            rotation = quaternion.euler(math.rad(-45), math.rad(20), 0),
            colour = colour(5, 5, 5)
        })

        local base = core.construct("block", {
            position = vector3(0, -10, 0),
            scale = vector3(30, 1, 30),
            colour = colour(1, 1, 1)
        })

        -- Load Default PlayerScripts
    end
}