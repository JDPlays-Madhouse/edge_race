--- Use https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html#flying_collision_mask

-- TODO: Add a space age check.
local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel

-- local void_tile_collision_mask = table.deepcopy(data.raw["tile"]["out-of-map"].collision_mask);
local my_void_tile = table.deepcopy(data.raw["tile"]["out-of-map"]);


---Noise function for a given direction
---@return string
function wall_noise_function()
    -- local offset = settings.startup["wall-offset-distance"].value; ---@cast offset uint
    local direction = directions_of_travel.direction_with_settings();
    -- direction = directions_of_travel.direction(defines.direction.west);
    -- direction.cardinal = defines.direction.west;
    local offset = direction.starting_back_wall;
    local noise;
    if direction.cardinal == defines.direction.north then
        log("DirectionOfTravel North")
        noise = "(((y<=(" .. offset .. "))*-1)+(y>" .. offset .. "))*1000000000"
    elseif direction.cardinal == defines.direction.south then
        log("DirectionOfTravel South")
        noise = "(((y>=" .. offset .. ")*-1)+(y<" .. offset .. "))*1000000000"
    elseif direction.cardinal == defines.direction.west then
        noise = "(((x<=" .. offset .. ")*-1)+(x>" .. offset .. "))*1000000000"
    elseif direction.cardinal == defines.direction.east then
        noise = "(((x>=" .. offset .. ")*-1)+(x<" .. offset .. "))*1000000000"
    end
    log("Noise function: " .. noise)

    return noise
end

-- void_tile_collision_mask.layers["race-void-tile"] = true
my_void_tile.name = "race-void-tile";
local autoplace = {
    probability_expression = wall_noise_function(),
    default_enabled = false,
};


-- my_void_tile.autoplace = autoplace
-- data:extend({
--     my_void_tile,
-- })
--
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
