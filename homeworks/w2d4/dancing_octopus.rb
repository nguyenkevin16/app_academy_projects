# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has
# tiles in the following directions:
#
# tiles_array = [
#   "up", "right-up", "right",
#   "right-down", "down",
#   "left-down", "left",  "left-up"
# ]
#
# To play the game, the octopus must step on a tile with her
# corresponding tentacle. We can assume that the octopus's eight
# tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return
# the tentacle number (tile index) the octopus must move. This should
# take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3
def slow_dance(direction, tiles_array)
  tiles_array.each_index do |idx|
    return idx if direction == tiles_array[idx]
  end
end

# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so
# that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
# When you're finished, check out the solutions!
def fast_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end

if __FILE__ == $0
  tiles_array = [
    "up", "right-up", "right",
    "right-down", "down",
    "left-down", "left", "left-up"
  ]

  tiles_hash = Hash.new
  tiles_array.each_with_index do |direction, idx|
    tiles_hash[direction] = idx
  end

  slow_dance("up", tiles_array)
  slow_dance("right-down", tiles_array)
  fast_dance("up", tiles_hash)
  fast_dance("right-down", tiles_hash)
end
