require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise 'index out of bounds' if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    self[@length - 1] = nil
    @length -= 1 unless @length == 0
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.resize! if @length == @capacity

    self[@length - 1] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length == 0
    new_store = StaticArray.new(@capacity)
    shifted_val = @store[0]
    @store[0] = nil
    @length -= 1

    idx = 0
    while idx < @length
      new_store[idx] = @store[idx + 1]
      idx += 1
    end

    @store = new_store
    shifted_val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.resize! if @length == @capacity

    new_store = StaticArray.new(@capacity)
    new_store[0] = val

    idx = 0
    while idx < @length
      new_store[idx + 1] = @store[idx]
      idx += 1
    end

    @length += 1
    @store = new_store
  end

  # protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2)

    idx = 0
    while idx < @length
      new_store[idx] = @store[idx]
      idx += 1
    end

    @store = new_store
    @capacity *= 2
  end
end
