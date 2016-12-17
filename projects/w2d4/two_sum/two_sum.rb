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

#Time Complexity = n
def great_two_sum?(arr, target)
  cool_hash = Hash.new(0)
  arr.each do |el|
    cool_hash[el] += 1
    cool_hash[target - el] += 1
  end

  cool_hash.reject! {|k, v| v < 2 }
  cool_hash.length == 2
end


if __FILE__ == $0
  arr = [0, 1, 5, 7]
  p great_two_sum?(arr, 6) # => should be true
  p great_two_sum?(arr, 10) # => should be false
end
