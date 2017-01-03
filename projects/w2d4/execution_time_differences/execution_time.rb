# my_min O(n^2)
require "byebug"
def my_quadratic_min(arr)
  min = arr.first

  arr.each do |i|
    arr.each do |j|
      min = j if j < min
    end
  end

  min
end

def my_linear_min(arr)
  min = arr.first

  arr.each do |j|
    min = j if j < min
  end

  min
end

def my_quadratic_subsum(arr)
  subsets = []
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      subsets << arr[idx1..idx2]
    end
  end
  subsets.reject! {|elem| elem.empty?}
  sum = []
  subsets.each do |subset|
    sum << subset.inject(&:+)
  end
  sum.sort.last
end

def my_linear_subsum(arr)
  sum = 0
  arr.each do |el|
    sum += el if el > 0
  end
  sum
end




if __FILE__ == $0
  # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  # p my_quadratic_min(list)  # =>  -5
  # p my_linear_min(list)
  list = [5, 3, -7]
  p my_linear_subsum(list)

end
