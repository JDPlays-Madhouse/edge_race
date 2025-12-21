local directions_of_travel = {} ---@class DirectionOfTravel

---@class Direction
---@field name defines.direction
---@field map_gen_settings MapGenSettings
---@field starting_back_wall int
---@field cardinal CardinalDirection

---@alias CardinalDirection defines.direction.north|defines.direction.east|defines.direction.west|defines.direction.south

--- Map Generation Settings for Plant creation.
---@return MapGenSettings
directions_of_travel.map_gen_settings = function()
    return directions_of_travel.direction_with_settings().map_gen_settings;
end


--- Map input to a valid CardinalDirection
---@param input string
---@return CardinalDirection|nil
directions_of_travel.map_direction = function(input)
    if input == "up" then
        return defines.direction.north
    elseif input == "left" then
        return defines.direction.west
    elseif input == "down" then
        return defines.direction.south
    elseif input == "right" then
        return defines.direction.east
    else
        return nil
    end
end

--- Generates all the race parameters from startup settings.
---@return Direction Direction Settings for the race.
directions_of_travel.direction_with_settings = function()
    local race_width = settings.startup["race-width"].value; ---@cast race_width int;
    local offset = settings.startup["wall-offset-distance"].value; ---@cast offset int
    local direction_setting = directions_of_travel.map_direction(settings.startup["direction-of-travel"]
        .value --[[@as string]]);

    local direction = {
        name = direction_setting,
        race_width = race_width,
        map_gen_settings = { width = 2000000, height = 2000000, },
        cardinal =
            direction_setting
    };

    if direction_setting == defines.direction.north then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = offset
    elseif direction_setting == defines.direction.south then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = -offset
    elseif direction_setting == defines.direction.west then
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = offset
    else
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = -offset
    end --[[@cast direction Direction]]

    return direction;
end

return directions_of_travel;
