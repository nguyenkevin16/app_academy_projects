class Array
  def my_each(&prc)
    self.length.times { |idx| prc.call(self[idx]) }
  end
end

# Write a recursive method, range, that takes a start and an end and
# returns an array of all numbers between. If end < start, you can
# return the empty array.
def range(min, max)
  return [] if max < min
  range(min, max - 1) << max
end

# Write both a recursive and iterative version of sum of an array.
def sum_rec(arr)
  return arr.first if arr.size <= 1
  arr.pop + sum_rec(arr)
end

def sum_iter(arr)
  arr.inject(:+)
end

# Write a recursive method permutations(array) that calculates all the
# permutations of the given array. For an array of length n there are n!
# different permutations. So for an array with three elements we will
# have 3 * 2 * 1 = 6 different permutations.
def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift
  perms = permutations(arr)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_perms.sort
end

# # The binary search algorithm begins by comparing the target value to
# the value of the middle element of the sorted array. If the target value
# is equal to the middle element's value, then the position is returned
# and the search is finished. If the target value is less than the middle
# element's value, then the search continues on the lower half of the
# array; or if the target value is greater than the middle element's value,
# then the search continues on the upper half of the array. This process
# continues, eliminating half of the elements, and comparing the target
# value to the value of the middle element of the remaining elements -
# until the target value is either found (and its associated element
# position is returned), or until the entire array has been searched
# (and "not found" is returned).
#
# # Write a recursive binary search: bsearch(array, target). Note that
# binary search only works on sorted arrays. Make sure to return the
# location of the found object (or nil if not found!). Hint: you will
# probably want to use subarrays.
def bsearch(arr, target)
  return nil if arr.length <= 1

  mid = arr.length / 2
  case target <=> arr[mid]
  when -1
    bsearch(arr[0..mid], target)
  when 0
    mid
  when 1
    bsearch(arr[mid..-1], target)
  end
end


def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0..-2])
  subs.concat(subs.map { |sub| sub + [arr.last] })
end

# Merge Sort
#
# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one. Do not use a
# length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif
# and check out this diagram.
def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2

  left = arr[0...mid]
  right = arr[mid..-1]

  my_merge(merge_sort(left), merge_sort(right))
end

def my_merge(left, right)
  whole = []

  until left.empty? || right.empty?
    whole << (left.first < right.first ? left.shift : right.shift)
  end

  whole + left + right
end


def deep_dup(arr)
  arr.map { |el| (el.is_a?(Array) ? deep_dup(el) : el) }
end

if __FILE__ == $0
  # range(1, 3)
  # sum_rec([735, 5])
  # sum_iter([735, 5])
  # p permutations([1, 2, 3])
  # p merge_sort([2, 1, 5, 6, 7])
  # bsearch([1, 2, 3], 2)

  p bsearch([1], 1)

  # p deep_dup([1, 2, [3]])

  # p subsets([1,2,3])
end
