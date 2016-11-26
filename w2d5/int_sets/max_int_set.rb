require 'byebug'

class MaxIntSet
  attr_accessor :store, :size

  def initialize(max)
    @store = Array.new(max, false)
    @size = max
  end

  def insert(el)
    raise "out of range" if el > size - 1
    store[el] = true
  end

  def remove(el)
    raise "out of range" if el > size - 1
    store[el] = false
  end

  def include?(el)
    return false if store[el].nil?
    store[el]
  end
end

if __FILE__ == $0
  s = MaxIntSet.new(4)
  s.insert(0)
  s.insert(2)
  s.insert(3)

  p s.store
end
