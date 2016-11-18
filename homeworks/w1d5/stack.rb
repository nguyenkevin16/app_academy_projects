class Stack
  def initialize(stack = [])
    # create ivar to store stack here!
    @stack = stack
  end

  def add(el)
    # adds an element to the stack
    stack.push(el)
  end

  def remove
    # removes one element from the stack
    stack.pop
  end

  def show
    # return a copy of the stack
    stack
  end

  private

  attr_accessor :stack
end
