# Now it's time to bring it all together. Take the techniques you've
# learned (and the classes you've implemented) to implement a
# MinMaxStackQueue. The goal at the end of this is to have enqueue,
# dequeue, max, and min methods, all of which run in constant time.
# Once we have this, we'll be well-equipped to produce an optimized
# solution to the Windowed Max Range problem.
require_relative 'min_max_stack'

class MinMaxStackQueue

  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
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

  def max
    # At most two operations; O(1)
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
    mins.min
  end

  private

  def queueify
    # reverse order of in_stack by pushing it to out_stack
    # only called if out_stack is empty
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end

end

if __FILE__ == $0
  n = MinMaxStackQueue.new
end
