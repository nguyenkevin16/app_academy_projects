require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end

  def count
    store.length
  end

  def extract
    store[0], store[store.length - 1] = store[store.length - 1], store[0]
    popped = store.pop
    BinaryMinHeap.heapify_down(store, 0)
    popped
  end

  def peek
    store.first
  end

  def push(val)
    store.push(val)
    BinaryMinHeap.heapify_up(store, count - 1)
  end

  def self.child_indices(len, parent_index)
    (1..2).map { |i| parent_index * 2 + i }.select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    children = child_indices(len, parent_idx)
    return array if children.empty?

    if array[parent_idx] > array[children.first]
      array[parent_idx], array[children.first] =
        array[children.first], array[parent_idx]

      heapify_down(array, children.first)
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    parent_idx = parent_index(child_idx)

    if array[child_idx] < array[parent_idx]
      array[child_idx], array[parent_idx] =
        array[parent_idx], array[child_idx]

      heapify_up(array, parent_idx)
    end
  end

  protected

  attr_accessor :prc, :store
end
