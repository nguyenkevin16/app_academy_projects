require "byebug"

# Time Complexity = n * n!
def first_anagram?(first_word, second_word)
  perms = first_word.chars.permutation

  perms.each do |perm|
    return true if perm.join == second_word
  end

  false
end

#Time Complexity = n^2 or maybe n^4?
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

# Time complexity = n^2
# or... is the first_word == second_word another n
def third_anagram?(first_word, second_word)
  first_word = first_word.chars.sort
  second_word = second_word.chars.sort

  first_word == second_word
end

# Time complexity = n^2 || n^3 depending on ==
def fourth_anagram?(first_word, second_word)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)

  first_word.chars.each { |char| first_hash[char] += 1 }
  second_word.chars.each { |char| second_hash[char] += 1 }

  first_hash == second_hash
end

if __FILE__ == $0
  p fourth_anagram?("gizmo", "sally")    #=> false
  p fourth_anagram?("elvis", "lives")    #=> true
end
