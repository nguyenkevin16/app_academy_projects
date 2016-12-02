def range(start_num, end_num)
  return [] if end_num <= start_num

  [start_num] + range(start_num + 1, end_num)
end

def range_i(start_num, end_num)
  arr = []
  start_num.upto(end_num - 1) { |num| arr << num }
  arr
end

def sum_rec(array)
  return 0 if array.empty?
  array.first + sum_rec(array[1..-1])
end

def sum_i(array)
  array.inject(&:+)
end

def exp_1(base, power)
  return 1 if power == 0
  base * exp_1(base, power - 1)
end

def exp_2(base, power)
  return 1 if power == 0
  return base if power == 1

  if power.even?
    exp_2(base, power / 2) * exp_2(base, power / 2)
  else
    base * (exp_2(base, (power - 1) / 2) * exp_2(base, (power - 1) / 2))
  end
end

def deep_dup(array)
  return array if array.empty?

  [array.first] + deep_dup(array[1..-1])
end

def fibonacci(num)
  return [1] if num == 1
  return [1, 1] if num == 2

  prev = fibonacci(num - 1)
  prev + [(prev[-2] + prev[-1])]
end

# permutations [1] # => [1]
# permutations [1, 2] # => [1, 2], [2, 1]
def permutations(arr)
  return [arr] if arr.length <= 1

  prev_perms = permutations(arr[0..-2])
  total_perms = []

  prev_perms.each do |sub_perm|
    (0..sub_perm.length).each do |idx|
      total_perms << sub_perm[0...idx] + [arr.last] + sub_perm[idx..-1]
    end
  end

  total_perms
end

def bsearch(arr, target)
  return nil if arr.empty?
  return nil if arr.length == 1 && target != arr.first

  mid = arr.length / 2

  case  target <=> arr[mid]
  when -1
    bsearch(arr[0...mid], target)
  when 0
    return mid
  when 1
    idx = bsearch(arr[mid..-1], target)
    idx + mid unless idx.nil?
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }

    return self if self.length == 1

    mid = self.length / 2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    whole = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) <= 0
        whole << left.shift
      else
        whole << right.shift
      end
    end

    whole + left + right
  end
end

def subsets(array)
  return [array] if array.empty?

  total_sets = []
  prev_sets = subsets(array[0..-2])
  total_sets += prev_sets

  prev_sets.each do |sub_arr|
    total_sets << sub_arr + [array.last]
  end

  total_sets
end

def greedy_make_change 

if __FILE__ == $0
  p subsets([]) # => [[]]
  p subsets([1]) # => [[], [1]]
  p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
  p subsets([1, 2, 3])
  # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
end
