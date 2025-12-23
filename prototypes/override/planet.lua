local util = require("__core__.lualib.util");

---@type data.MapGenSettings;
local modified_map_gen = {
    autoplace_settings = {
        ["tile"] = {
            settings = {
                ["out-of-map"] = {}
            }
        }
    }
};

for name, planet in pairs(data.raw["planet"]) do
    planet = util.merge({ table.deepcopy(planet), });
    data.raw["planet"][name].map_gen_settings = util.merge({ planet.map_gen_settings, modified_map_gen })
end
