# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a
  new_string = ""

  str.chars.each do |char|
    if char == " "
      new_string << " "
    else
      orig_idx = alphabet.index(char)
      new_idx = (orig_idx + shift) % 26

      new_char = alphabet[new_idx]
      new_string << new_char
    end
  end

  new_string
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  total = 0

  if num % 10 != 0
    total += num % 10
    num -= num % 10
  else
    total += num / 10
    total -= num * 10
  end

  total
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet = ("a".."z").to_a if alphabet.nil?

  chars_hash = Hash.new(0)
  str.chars.each { |char| chars_hash[char] += 1 }
  new_str = ""

  alphabet.each do |alphabet_letter|
    if chars_hash.keys.include?(alphabet_letter)
      new_str << alphabet_letter * chars_hash[alphabet_letter]
      chars_hash[alphabet_letter] = 0
    end
  end

  new_str

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    array = []

    0.upto(self.count - 2) do |idx1|
      1.upto(self.count - 1) do |idx2|
        array << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end

    array
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    array = []
    dictionary.each do |word|
      array << word unless self.scan(word).count == 0
    end
    array
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  array = []
  1.upto(num) { |divisor| array << divisor if num % divisor == 0 }
  array
end
