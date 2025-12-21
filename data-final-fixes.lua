for name, planet in pairs(data.raw["planet"]) do
    planet = table.deepcopy(planet);

    local map_gen_settings = planet.map_gen_settings;

    if map_gen_settings == nil then
        map_gen_settings = {};
    end

    if map_gen_settings.autoplace_settings ~= nil then
        map_gen_settings.autoplace_settings["tile"].settings["out-of-map"] = {
        }
    else
        map_gen_settings.autoplace_settings = {
            ["tile"] = {
                settings = {
                    ["out-of-map"] = {}
                }
            }
        }
    end
    data.raw["planet"][name].map_gen_settings = map_gen_settings
end
