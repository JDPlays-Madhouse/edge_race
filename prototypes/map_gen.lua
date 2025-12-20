local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel

data.raw["map-gen-presets"].default["left"] = {
    order = "aa",
    basic_settings = directions_of_travel.map_gen_settings(defines.direction.west),
}
data.raw["map-gen-presets"].default["right"] = {
    order = "ab",
    basic_settings = directions_of_travel.map_gen_settings(defines.direction.east),
}
data.raw["map-gen-presets"].default["up"] = {
    order = "ac",
    basic_settings = directions_of_travel.map_gen_settings(defines.direction.north),
}
data.raw["map-gen-presets"].default["down"] = {
    order = "ad",
    basic_settings = directions_of_travel.map_gen_settings(defines.direction.south),
}
