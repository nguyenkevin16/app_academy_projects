require_relative 'my_stack'

class StackQueue

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    # if out_stack is empty, flip the in_stack into out_stack
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def size
    @in_stack.size + @out_stack.size
  end

  private

  def queueify
    # reverse order of in_stack by pushing it to out_stack
    # only called if out_stack is empty
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end

end
