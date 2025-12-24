data:extend({
    {
        type = "string-setting",
        name = "direction-of-travel",
        setting_type = "startup",
        order = "a",
        default_value = "left",
        allowed_values = { "left", "up", "right", "down" }
    },
    {
        type = "int-setting",
        name = "wall-offset-distance",
        setting_type = "startup",
        order = "aa",
        default_value = 500,
        minimum_value = 500,
    },
    {
        type = "int-setting",
        name = "race-width",
        setting_type = "startup",
        order = "ab",
        default_value = 500,
        minimum_value = 500,
    },
    {
        type = "double-setting",
        name = "void-pollution-absorption",
        setting_type = "startup",
        order = "ac",
        default_value = 0,
    },
    -- {
    --     type = "int-setting",
    --     name = "time-until-wall-starts-moving",
    --     setting_type = "runtime-global",
    --     order = "ab",
    --     default_value = 60,
    --     hidden = true
    -- },
    -- {
    --     type = "int-setting",
    --     name = "wall-speed",
    --     setting_type = "runtime-global",
    --     order = "ac",
    --     default_value = 100,
    --     minimum_value = 50,
    --     hidden = true
    -- },
})
