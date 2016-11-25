require "byebug"

# Time Complexity = n * n!
def first_anagram?(first_word, second_word)
  perms = first_word.chars.permutation

  perms.each do |perm|
    return true if perm.join == second_word
  end

  false
end

#Time Complexity = n^2
def second_anagram?(first_word, second_word)
  (0...first_word.length).each do |idx1|
    letter_to_check = first_word[idx1]
    (0...second_word.length).each do |idx2|
      if second_word[idx2] == letter_to_check
        second_word.delete!(second_word[idx2])
        first_word.delete!(first_word[idx1])
      end
    end
  end
  return first_word == second_word
end

# Time complexity = n log n
def third_anagram?(first_word, second_word)
  first_word = first_word.chars.sort
  second_word = second_word.chars.sort

  first_word == second_word
end

# Time complexity = n
def fourth_anagram?(first_word, second_word)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)

  first_word.chars.each { |char| first_hash[char] += 1 }
  second_word.chars.each { |char| second_hash[char] += 1 }

  first_hash == second_hash
end

# Time complexity = n
def fifth_anagram?(first_word, second_word)
  word_count = Hash.new(0)
  first_word.chars.each { |char| word_count[char] += 1 }
  second_word.chars.each { |char| word_count[char] -= 1 }

  word_count.all? {|_, val| val == 0}
end

if __FILE__ == $0
  p fifth_anagram?("gizmo", "sally")    #=> false
  p fifth_anagram?("elvis", "lives")    #=> true
end
