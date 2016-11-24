require 'byebug'

def max_windowed_range(array, window_size)
  current_max_range = 0

  array.each_with_index do |el, idx|
    end_index = idx + window_size - 1
    break if end_index >= array.length

    slice = array[idx..end_index]
    difference = slice.max - slice.min

    current_max_range = difference if difference > current_max_range
  end

  current_max_range
end

if __FILE__ == $0
  p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

end
