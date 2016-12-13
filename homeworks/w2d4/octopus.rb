# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths
def sluggish_octopus(fish_arr)
  longest_fish = fish_arr.first

  fish_arr.each_with_index do |fish1, idx1|
    fish_arr.each_with_index do |fish2, idx2|

      if fish2.length > fish1.length && idx1 != idx2
        longest_fish = fish2
      end

    end
  end

  longest_fish
end

# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember that
# Big O is classified by the dominant term.
def dominant_octopus(fish_arr)
  sorted = quick_sort(fish_arr)
  sorted.last
end

def quick_sort(fish_arr)
  return fish_arr if fish_arr.length < 2

  pivot = fish_arr.first
  left = fish_arr[1..-1].select { |fish| fish.length <= pivot.length }
  right = fish_arr[1..-1].select { |fish| fish.length > pivot.length }

  quick_sort(left) + [pivot] + quick_sort(right)
end

# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.
def clever_octopus(fish_arr)
  longest_fish = fish_arr.first

  fish_arr.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end

if __FILE__ == $0
  fish_arr = [
    'fish', 'fiiish', 'fiiiiish',
    'fiiiish', 'fffish', 'ffiiiiisshh',
    'fsh', 'fiiiissshhhhhh'
  ]

  p sluggish_octopus(fish_arr)
  p dominant_octopus(fish_arr)
  p clever_octopus(fish_arr)
end
