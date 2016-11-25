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

class ResizingIntSet
  attr_accessor :store, :size

  def initialize(size)
    @store = Array.new(size) { [] }
    @size = size
  end

  def [](num)
    @store[num % size]
  end


  def insert(el)
    resize if full?

    self[el] << el
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

  private

  def full?
    max_bucket_size = 3
    @store.any? { |bucket| bucket.count >= max_bucket_size - 1 }
  end

  def resize
    size2 = size * 2
    new_store = Array.new(size2) { [] }

    @store.flatten.each { |el| new_store[el % size2] << el }

    @store = new_store
    @size = size2
  end

end




if __FILE__ == $0
  s = ResizingIntSet.new(4)
  s.insert(0)
  s.insert(2)
  s.insert(3)
  s.insert(4)

  s.insert(8)
  # s.insert(12)


  p s.store
end
