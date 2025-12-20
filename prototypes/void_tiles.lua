--- Use https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html#flying_collision_mask

-- TODO: Add a space age check.
local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel
local collision_mask_util = require("__core__.lualib.collision-mask-util");
local collision_mask_default = require("__core__.lualib.collision-mask-defaults");
local character_collision_mask = collision_mask_default["character/flying"];

-- local void_tile_collision_mask = table.deepcopy(data.raw["tile"]["out-of-map"].collision_mask);
local my_void_tile = table.deepcopy(data.raw["tile"]["out-of-map"]);


---Noise function for a given direction
---@return string
function wall_noise_function()
    -- local offset = settings.startup["wall-offset-distance"].value; ---@cast offset uint
    local direction = directions_of_travel.direction_with_settings();
    -- direction = directions_of_travel.direction(defines.direction.west);
    -- direction.cardinal = defines.direction.west;

    local noise;
    if direction.cardinal == defines.direction.north then
        noise = "y<(" .. direction.starting_back_wall .. ")";
    elseif direction.cardinal == defines.direction.south then
        noise = "y>(" .. direction.starting_back_wall .. ")";
    elseif direction.cardinal == defines.direction.west then
        noise = "x>(" .. direction.starting_back_wall .. ")";
    elseif direction.cardinal == defines.direction.east then
        noise = "x<(" .. direction.starting_back_wall .. ")";
    end

    return noise
end

-- void_tile_collision_mask.layers["race-void-tile"] = true
my_void_tile.name = "race-void-tile";
my_void_tile.layer = 1;
-- my_void_tile.collision_mask = {
--     layers = {
--         -- ground_tile=true,
--         -- water_tile=true,
--         -- resource=true,
--         floor = true,
--         item = true,
--         object = true,
--         player = true,
--         doodad = true,
--         out_of_map = true
--     }
-- };
my_void_tile.autoplace = {
    -- probability_expression = wall_noise_function(),
    -- richness_expression = wall_noise_function(),

    probability_expression = "(x>100)*100000+(x<=100)*-100000",
    default_enabled = false,
    order = "zzzzz"
}
data:extend({
    my_void_tile,
}
)

for name, planet in pairs(data.raw["planet"]) do
    planet = table.deepcopy(planet);

    local map_gen_settings = planet.map_gen_settings;

    if map_gen_settings == nil then
        map_gen_settings = {};
    end

    if map_gen_settings.autoplace_settings ~= nil then
        map_gen_settings.autoplace_settings["tile"].settings["race-void-tile"] = {
        }
    else
        map_gen_settings.autoplace_settings = {
            ["tile"] = {
                settings = {
                    ["race-void-tile"] = {}
                }
            }
        }
    end
    data.raw["planet"][name].map_gen_settings = map_gen_settings
end
