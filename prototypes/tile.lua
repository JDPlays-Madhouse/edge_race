local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel

---Noise function for a current settings. For settinging the probabitity value to either
----1,000,000,000 or 1,000,000,000 depending where the wall lies.
---@return string
function wall_noise_function()
    local direction = directions_of_travel.direction_with_settings();
    local offset = direction.starting_back_wall;
    local noise;
    if direction.name == defines.direction.north then
        noise = "(((y<=(" .. offset .. "))*-1)+(y>" .. offset .. "))*1000000000"
    elseif direction.name == defines.direction.south then
        noise = "(((y>=" .. offset .. ")*-1)+(y<" .. offset .. "))*1000000000"
    elseif direction.name == defines.direction.west then
        noise = "(((x<=" .. offset .. ")*-1)+(x>" .. offset .. "))*1000000000"
    elseif direction.name == defines.direction.east then
        noise = "(((x>=" .. offset .. ")*-1)+(x<" .. offset .. "))*1000000000"
    end
    return noise
end

-- local my_void_tile = table.deepcopy(data.raw["tile"]["out-of-map"]);
-- my_void_tile.name = "race-void-tile";
-- void_tile_collision_mask.layers["race-void-tile"] = true

local autoplace = {
    probability_expression = wall_noise_function(),
    default_enabled = false,
};

data.raw["tile"]["out-of-map"].autoplace = autoplace

if mods["space-age"] then
    local util = require("__core__.lualib.util"); ---@type util
    local out_of_map = data.raw["tile"]["out-of-map"];
    local mod_void = {
        effect = "space",
        effect_color = { 0.5, 0.507, 0 },
        effect_color_secondary = { 0, 68, 25 },
        variants =
        {
            main =
            {
                {
                    picture = "__space-age__/graphics/terrain/empty-space.png",
                    count = 1,
                    size = 1
                }
            },
            empty_transitions = true
        },
        absorptions_per_second = { pollution = 0.00000018 }
    }
    out_of_map = util.merge({ out_of_map, mod_void });
    data.raw["tile"]["out-of-map"] = out_of_map;
end
