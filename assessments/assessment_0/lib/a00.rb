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
  encrypted_str = ""

  str.chars.each do |char|
    if char == " "
      encrypted_str << " "
      next
    end

    new_char_idx = (alphabet.index(char) + shift) % 26
    new_char = alphabet[new_char_idx]
    encrypted_str << new_char
  end

  encrypted_str
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  root = num

  until root < 10
    root = digital_root_step(root)
  end

  root
end

def digital_root_step(num)
  total = num % 10
  remainder = num - total

  total + remainder / 10
end

# 67
# total = 7
# remainder = 60
# total = 13


# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  new_str = ""

  alphabet.each do |ordered|
    str.each_char do |letter|
      new_str << ordered if ordered == letter
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
    two_sum_pos = []

    (0...(self.length - 1)).each do |idx1|
      (idx1...self.length).each do |idx2|
        if self[idx1] + self[idx2] == 0 && idx1 != idx2
          two_sum_pos << [idx1, idx2]
        end
      end
    end

    two_sum_pos
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    subwords = []

    (0..self.length).each do |start_idx|
      (start_idx..self.length).each do |end_idx|
        substr = self[start_idx..end_idx]
        subwords << substr if dictionary.include?(substr)
      end
    end

    subwords.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []

  1.upto(num) do |factor|
    factors << factor if num % factor == 0
  end

  factors
end
