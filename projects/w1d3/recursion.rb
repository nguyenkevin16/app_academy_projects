require 'byebug'

def range(start_num, end_num)
  return [] if end_num < start_num
  return [end_num] if start_num == end_num

  start_arr = [start_num]
  start_arr + range(start_num + 1, end_num)
end

def sum_array(arr)
  return arr.first if arr.length == 1

  arr.pop + sum_array(arr)
end

def sum_array_i(arr)
  arr.inject(:+)
end

def exp_one(base, exp)
  return 1 if exp == 0

  base * exp_one(base, exp - 1)
end

def exp_two(base, exp)
  return 1 if exp == 0
  return base if exp == 1

  if exp.even?
    even_case = exp_two(base, exp / 2)
    even_case * 2
  else
    odd_case = exp_two(base, (exp - 1) / 2)
    base * (odd_case * 2)
  end
end

def deep_dup(arr)
  dup_arr = []
  arr.each do |el|
    dup_arr << (el.is_a?(Array) ? deep_dup(el) : el)
  end
  dup_arr
end

def fibonacci(num)
  return 1 if num == 1
  return [1, 1] if num == 2

  arr = fibonacci(num - 1)
  arr << arr[-1] + arr[-2]
end

def fibonacci_i(num)
  return 1 if num == 1

  fib = [1, 1]
  fib << (fib[-1] + fib[-2]) until fib.length == num
  fib
end

def permutations(arr)
  return [arr] if arr.empty?


  to_add = arr.pop
  permutations(arr) << to_add


end

def bsearch(array, target)
  half = array.length / 2
  mid = (array.length.even? ? half - 1 : half)

  return nil if target != array[middle_idx] && array.empty?


  if target == array[mid]
    mid
  elsif target < array[mid]
    bsearch(array[0...mid], target)
  elsif target > array[mid]
    bsearch_value = bsearch(array[ (mid + 1)..-1 ], target)

    return nil if bsearch_value.nil?
    mid + bsearch_value + 1
  end
end

def merge_sort(arr)
  return nil if arr.empty?
  return arr if arr.length == 1

  half = arr.length / 2
  mid_idx = (arr.length.even? ? half - 1 : half)

  left = arr[0..mid_idx]
  right = arr[mid_idx + 1..-1]

  my_merge(merge_sort(left), merge_sort(right))
end

def my_merge(first_half, second_half)
  whole = first_half + second_half
  whole.sort
end

def subsets(arr)
  return [arr] if arr.empty?

  el = arr.pop
  set = subsets(arr) << [el]
end

if __FILE__ == $0

end
