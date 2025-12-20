local directions_of_travel = {} ---@class DirectionOfTravel

---@class Direction
---@field name defines.direction
---@field map_gen_settings MapGenSettings
---@field starting_back_wall int
---@field cardinal CardinalDirection

---@alias CardinalDirection defines.direction.north|defines.direction.east|defines.direction.west|defines.direction.south

--- Generates all the race parameters.
--- @param direction_setting CardinalDirection
---@return Direction Direction Settings for the race.
directions_of_travel.direction = function(direction_setting)
    local race_width = 500;

    local direction = {
        name = direction_setting,
        race_width = race_width,
        map_gen_settings = { width = 2000000, height = 2000000, },
        starting_back_wall = 100,
        cardinal =
            direction_setting
    };

    if direction_setting == defines.direction.north then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = -race_width
    elseif direction_setting == defines.direction.west then
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = race_width
    elseif direction_setting == defines.direction.south then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = race_width
    else
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = -race_width
    end --[[@cast direction Direction]]

    return direction;
end


--- Map Generation Settings for Plant creation.
--- @param direction_setting defines.direction.north|defines.direction.east|defines.direction.west|defines.direction.south
---@return MapGenSettings
directions_of_travel.map_gen_settings = function(direction_setting)
    return directions_of_travel.direction(direction_setting).map_gen_settings;
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
--- Generates all the race parameters.
---@return Direction Direction Settings for the race.
directions_of_travel.direction_with_settings = function()
    local race_width = 500;
    local offset = settings.startup["wall-offset-distance"].value; ---@cast offset int
    local direction_setting = directions_of_travel.map_direction(settings.startup["direction-of-travel"].value);

    local direction = {
        race_width = race_width,
        map_gen_settings = { width = 2000000, height = 2000000, },
        cardinal =
            direction_setting
    };

    if direction_setting == defines.direction.north then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = -offset
        direction.name = defines.direction.north
    elseif direction_setting == defines.direction.west then
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = offset
        direction.name = defines.direction.west
    elseif direction_setting == defines.direction.south then
        direction.map_gen_settings.width = race_width
        direction.starting_back_wall = offset
        direction.name = defines.direction.south
    else
        direction.map_gen_settings.height = race_width
        direction.starting_back_wall = -offset
        direction.name = defines.direction.east
    end --[[@cast direction Direction]]

    return direction;
end

return directions_of_travel;
