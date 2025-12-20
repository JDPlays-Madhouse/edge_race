local directions_of_travel = {} ---@class DirectionOfTravel

---@class Direction
---@field name defines.direction
---@field race_width uint
---@field map_gen_settings MapGenSettings
---@field starting_back_wall uint

---@class BackWallPosition
---@field offset uint
---@field orientation RealOrientation


--- Generates all the race parameters.
--- @param direction_setting defines.direction.north|defines.direction.east|defines.direction.west|defines.direction.south
---@return Direction Direction Settings for the race.
directions_of_travel.direction = function(direction_setting)
    local race_width = 500;

    local direction = { race_width = race_width, map_gen_settings = { width = 2000000, height = 2000000, } };

    if direction_setting == defines.direction.north then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = -race_width
        direction.name = defines.direction.north
    elseif direction_setting == defines.direction.west then
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = race_width
        direction.name = defines.direction.west
    elseif direction_setting == defines.direction.south then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = race_width
        direction.name = defines.direction.south
    else
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = -race_width
        direction.name = defines.direction.east
    end --[[@cast direction Direction]]

    return direction;
end


--- Map Generation Settings for Plant creation.
--- @param direction_setting defines.direction.north|defines.direction.east|defines.direction.west|defines.direction.south
---@return MapGenSettings
directions_of_travel.map_gen_settings = function(direction_setting)
    return directions_of_travel.direction(direction_setting).map_gen_settings;
end

return directions_of_travel;
