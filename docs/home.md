# Race to the Edge

## Settings

### Direction of Travel

Type: String
Name: direction-of-travel
Setting Type: startup
Default Value: left
allowed_values = "left", "up", "right", "down"
Restart on Change: true

Direction of travel for the race.

### Wall Offset

Type: Int
Name: wall-offset-distance
Setting Type: startup
Default Value: 500
Minimum Value: 500
Restart on Change: true

This setting sets the rear offset behind spawn. Any less than 500 and the spawn
area was affected.

### Race Width

Type: Int
Name: race-width
Setting Type: startup
Default Value: 500
Minimum Value: 500
Restart on Change: true

This setting sets the width/height of the map depending on the direction.

### Void Pollution Absorption

Type: Double
Name: void-pollution-absorption
Setting Type: startup
Default Value: 0
Restart on Change: true

The value is divided by 1,000,000 to convert from 100 which is the normal default
value to 0.0001. Positive value mean that the pollution is absorbed where negative
values would mean that it is creating more when it is first initiated by having
an adjacent chunk have pollution.

| Tile            | Value |
| --------------- | ----- |
| Void/Out of Map | 100   |
| Fulgora         | 30    |
| Gleba Water     | 30    |
| Lave            | 30    |
| Vulcanus        | 30    |
| Water           | 25    |
| Dirt            | 18    |
| Grass           | 18    |
| Red Desert      | 15    |
| Sand            | 15    |
| Gleba           | 10    |
| Ice             | 5     |
