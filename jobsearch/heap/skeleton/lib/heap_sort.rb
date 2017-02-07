require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new

    each do |el|
      heap.push(el)
    end

    length.times do |i|
      self[i] = heap.extract
    end

    self
  end
end
