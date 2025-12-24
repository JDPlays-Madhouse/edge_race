local directions_of_travel = require("__edge_race__.utility.lists.direction"); ---@type DirectionOfTravel
local util = require("__core__.lualib.util"); ---@type util

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

local out_of_map = data.raw["tile"]["out-of-map"];

if mods["space-age"] then
    local empty_space = data.raw["tile"]["empty-space"];
    local mod_void = {
        effect = empty_space.effect,
        effect_color = empty_space.effect_color,
        effect_color_secondary = empty_space.effect_color_secondary,
        variants = empty_space.variants,
    }
    out_of_map = util.merge({ out_of_map, mod_void });
end


local autoplace = {
    probability_expression = wall_noise_function(),
    -- default_enabled = false,
};
local pollution_setting = settings.startup["void-pollution-absorption"].value;
log("Pollution Setting: " .. pollution_setting);
local pollution_absorption = (tonumber(pollution_setting) or 0.0) / 1000000; ---@as double
log(pollution_absorption);
local mod_void = {
    autoplace = autoplace,
    absorptions_per_second = { pollution = pollution_absorption }
}

out_of_map = util.merge({ out_of_map, mod_void });
data.raw["tile"]["out-of-map"] = out_of_map;
