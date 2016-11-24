def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      next if idx1 == idx2
      return true if el1 + el2 == target
    end
  end
  false
end

# Time Complexity = n log n b/c of .sort! if it's quick_sort
def okay_two_sum?(arr, target)
  arr.sort!
  lower_index = 0
  upper_index = arr.length - 1

  until lower_index >= upper_index
    case arr[lower_index] + arr[upper_index] <=> target
    when -1
      lower_index += 1
    when 0
      return true
    when 1
      upper_index -= 1
    end
  end

  false
end


if __FILE__ == $0
  arr = [0, 1, 5, 7]
  p okay_two_sum?(arr, 6) # => should be true
  p okay_two_sum?(arr, 10) # => should be false
end
