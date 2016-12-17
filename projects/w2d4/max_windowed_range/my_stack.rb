# Implement pop, push, peek, size, and empty? methods on your Stack.
class MyStack
  attr_reader :store

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end

  def peek
    @store.last unless empty?
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end
