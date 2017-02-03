require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[(@start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    raise 'index out of bounds' if index >= @length
    @store[(@start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    popped_val = self[@length - 1]
    self[@length - 1] = nil
    @length -= 1 unless @length == 0
    popped_val
  end

  # O(1) ammortized
  def push(val)
    self.resize! if @length >= @capacity

    @length += 1
    self[@length - 1] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if @length == 0

    shifted_val = self[0]
    self[0] = nil
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1

    shifted_val
  end

  # O(1) ammortized
  def unshift(val)
    self.resize! if @length == @capacity

    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)

    old_idx = @start_idx
    @length.times do |new_idx|
      new_store[new_idx] = @store[old_idx]
      old_idx = (old_idx + 1) % @capacity
      new_idx += 1
    end

    @store = new_store
    @capacity *= 2
    @start_idx = 0
  end
end
