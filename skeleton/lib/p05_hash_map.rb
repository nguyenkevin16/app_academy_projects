require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |list|
      return true if list.include?(key)
    end

    false
  end

  def hash(key, num_buckets = @store.length)
    key.hash % num_buckets
  end

  def set(key, val)
    resize! if @count == num_buckets

    index = hash(key)

    if @store[index].include?(key)
      @store[index].update(key, val)
    else
      @store[index].append(key, val)
      @count += 1
    end
  end

  def get(key)
    index = hash(key)
    return @store[index].get(key) if @store[index].include?(key)
    nil
  end

  def delete(key)
    @store.each do |list|
      if list.include?(key)
        list.remove(key)
        @count -= 1
      end
    end
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { LinkedList.new }

    each do |key, val, list|
      index = hash(key, num_buckets * 2)
      new_arr[index].append(key, val)
    end

    @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
