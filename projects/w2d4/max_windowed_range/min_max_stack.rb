require_relative 'my_stack'

class MinMaxStack

  def initialize
    @store = MyStack.new
  end

  def push(el)
    @store.push(
      value: el,
      max: max_update(el),
      min: min_update(el)
    )
  end

  def pop
    @store.pop[:value] unless empty?
  end

  def peek
    @store.last[:value] unless empty?
  end

  def min
    return @store.peek[:min] unless empty?
    0
  end

  def max
    return @store.peek[:max] unless empty?
    0
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  # private
  attr_reader :store

  def max_update(val)
    val > max ? val : [max, val].max
  end

  def min_update(val)
    val < min ? val : [min, val].min
  end

  def inspect
    str_arr = []

    @store.store.each do |el|
      str_arr << el[:value].to_s
    end

    str_arr.join(" ")
  end
end

if __FILE__ == $0
  n = MinMaxStack.new
end
