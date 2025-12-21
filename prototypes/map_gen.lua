local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel

local map_gen_presets = table.deepcopy(data.raw["map-gen-presets"]["default"]);
local map_gen_settings = directions_of_travel.direction_with_settings().map_gen_settings;
for name, map_gen in pairs(map_gen_presets) do
    if name ~= "name" and name ~= "type" and name ~= "default" then
        local basic_settings = map_gen.basic_settings or {}; ---@type (data.MapGenSettings)?
        for setting, value in pairs(map_gen_settings) do
            basic_settings[setting] = value;
        end
        data.raw["map-gen-presets"].default[name].basic_settings = basic_settings;
    end
end




data.raw["map-gen-presets"].default["edge-race"] = {
    -- default = true,
    order = "aa",
    ---@diagnostic disable-next-line: assign-type-mismatch
    basic_settings = map_gen_settings,
}
