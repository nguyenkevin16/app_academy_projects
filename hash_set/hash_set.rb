require_relative '../int_sets/resizing_int_set'
#require 'byebug'

class MyHashSet < ResizingIntSet

  def initialize(size)
    super
  end

  def [](num)
    puts 0.hash 
    @store[num.hash % size]
  end

  def resize

    size2 = size * 2
    new_store = Array.new(size2) { [] }

    @store.flatten.each do |el|
      new_store[el.hash % size2] << el
    end

    @store = new_store
    @size = size2
  end

end

if __FILE__ == $0
  s = MyHashSet.new(4)
  s.insert(0)
  s.insert(2)
  # s.insert(3)
  # s.insert(4)
  #
  # s.insert(8)
  # s.insert(12)

  p s.store
end
#

# 2100018465035746751
