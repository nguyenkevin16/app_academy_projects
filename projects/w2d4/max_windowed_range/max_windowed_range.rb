require_relative 'min_max_stack_queue'
require 'byebug'

# Time complexity == n * window size
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

def optimized_max_windowed_range(array, window_size)
  queue = MinMaxStackQueue.new
  best_range = 0

  array.each do |el|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_max_range = queue.max - queue.min
      best_range = current_max_range if best_range < current_max_range
    end
  end

  best_range
end



if __FILE__ == $0
  p optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
  p optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
  p optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
  p optimized_max_windowed_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

end
