class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def show
    queue
  end

  private

  attr_accessor :queue
end
