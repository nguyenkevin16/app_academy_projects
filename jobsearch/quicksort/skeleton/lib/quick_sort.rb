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
    return array if length < 2
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot = QuickSort.partition(array, start, length, &prc)
    sort2!(array, start, pivot - start, &prc)
    sort2!(array, pivot + 1, length - (pivot - start + 1), &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    pivot_idx = length / 2 + start
    partition_idx = start

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # swap first value with pivot value
    array[pivot_idx], array[start] = array[pivot_idx], array[start]

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(array[start], array[idx]) > 0
        array[partition_idx + 1], array[idx] = array[idx], array[partition_idx + 1]
        partition_idx += 1
      end
    end

    array[start], array[partition_idx] = array[partition_idx], array[start]

    partition_idx
  end
end
