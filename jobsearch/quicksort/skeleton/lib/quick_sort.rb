class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if array.length < 2

    pivot = array.first
    left = array[1..-1].select { |el| prc.call(el, pivot) == -1 }
    right = array[1..-1].select { |el| prc.call(el, pivot) != -1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    QuickSort.partition(array, start, length)
  end

  def self.partition(array, start, length, &prc)
    pivot_idx = length / 2 + start
    partition_idx = start

    # swap first value with pivot value
    array[pivot_idx], array[start] = array[pivot_idx], array[start]

    (start + 1...start + length).each do |idx|
      if array[idx] <= array[start]
        array[partition_idx + 1], array[idx] = array[idx], array[partition_idx + 1]
        partition_idx += 1
      end
    end

    pivot_idx
  end
end
