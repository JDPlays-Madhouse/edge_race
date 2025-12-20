--- Use https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html#flying_collision_mask

-- TODO: Add a space age check.

local void_tile_collision_mask = table.deepcopy(data.raw["tile"]["out_of_map"].collision_mask);
local my_void_tile = table.deepcopy(data.raw["tile"]["empty_space"]);

my_void_tile.name = "race_void_tile";
my_void_tile.collision_mask = void_tile_collision_mask;
data:extend({ my_void_tile })
