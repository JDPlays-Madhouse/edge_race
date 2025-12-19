data:extend({
    {
        type = "int-setting",
        name = "race-width",
        setting_type = "startup",
        localised_name = "race-width-name",
        order = "aa",
        localised_description = "race-width-description",
        default_value = 500,
        minimum_value = 100,
    },
    {
        type = "int-setting",
        name = "time-until-wall-starts-moving",
        setting_type = "startup",
        localised_name = "time-until-wall-starts-moving-name",
        order = "ab",
        localised_description = "time-until-wall-starts-moving-description",
        default_value = 60,
    },
    {
        type = "string-setting",
        name = "direction-of-travel",
        setting_type = "startup",
        order = "ac",
        localised_name = "direction-of-travel-name",
        localised_description = "direction-of-travel-description",
        default_value = "left",
        allowed_values = { "left", "up", "right", "down" }
    }
})
