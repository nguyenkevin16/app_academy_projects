class IntSet
  attr_accessor :store, :size

  def initialize(max)
    @store = Array.new(max) {[]}
    @size = max
  end

  def [](num)
    @store[num % size]
  end

  def insert(el)
    self[el] << el unless include?(el)
  end

  def remove(el)
    return unless include?(el)
    bucket = self[el]
    bucket.delete(el)
  end

  def include?(el)
    bucket = self[el]
    bucket.include?(el)
  end
end

if __FILE__ == $0
  s = IntSet.new(4)
  s.insert(0)
  s.insert(2)
  s.insert(3)
  s.insert(4)

  s.insert(8)
  # s.insert(12)

  p s.store
end
