class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @size = max
  end

  def insert(num)
    raise "Out of bounds" if num > @size || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return false if @store[num].nil?
    @store[num]
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { [] }
    @size = num_buckets
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    return unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @size
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets

    self[num] << num
    @count += 1
  end

  def remove(num)
    return unless include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2
    new_store = Array.new(new_size) { [] }

    @store.flatten.each { |el| new_store[el % new_size] << el }

    @store = new_store
  end
end
