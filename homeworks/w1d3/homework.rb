def sum_to(n)
  return nil if n < 0
  return n if n <= 1
  n + sum_to(n - 1)
end

def add_numbers(nums_array = nil)
  return nil if nums_array.nil?
  return nums_array.first if nums_array.length <= 1

  nums_array.pop + add_numbers(nums_array)
end

# Γ(n) = (n-1)!
def gamma_fnc(num = nil)
  return num if num <= 1

  (num - 1) * gamma_fnc(num - 1)
end


if __FILE__ == $0
  # puts sum_to(5) == 15 # => returns 15
  # puts sum_to(1) == 1 # => returns 1
  # puts sum_to(9) == 45 # => returns 45
  # puts sum_to(-8) == nil # => returns nil

  # add_numbers([1, 2, 3, 4]) # => returns 10
  # add_numbers([3]) # => returns 3
  # add_numbers([-80, 34, 7]) # => returns -39
  # add_numbers # => returns nil

  # Test Cases
  p gamma_fnc(0)  # => returns nil
  p gamma_fnc(1)  # => returns 1
  p gamma_fnc(4)  # => returns 6
  p gamma_fnc(8)  # => returns 5040
end
