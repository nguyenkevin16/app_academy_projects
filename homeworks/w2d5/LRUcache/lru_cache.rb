class LRUCache

  def initialize(cache_limit = 4)
    @cache_limit = cache_limit
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if count >= @cache_limit
      # remove last used element
      @cache.shift
    end

    if include?(el)
      # if already included, move to last position
      @cache << delete(find_index(el))
    else
      # add to end of array as recently used
      @cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache.dup
  end

  private
  # helper methods go here!
  def include?(el)
    @cache.include?(el)
  end

  def find_index(el)
    @cache.find_index(el)
  end

  def delete(idx)
    @cache.delete_at(idx)
  end

  attr_reader :cache_limit, :cache
end

if __FILE__ == $0
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show
  # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

end
