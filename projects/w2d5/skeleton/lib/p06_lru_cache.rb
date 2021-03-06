require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def insert(key, &prc)
    prc ||= Proc.new { |key| key ** 2 }

    if @map.include?(key)
      @store.update_link(key, prc.call(key)
      @map.set(key, )
    else
      @store.append(key, prc.call(key)
      @map.set(key,)
    end

  end

  def no

  end


  def count
    @map.count
  end

  def get(key)
    @map.get(key)
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
  end
end
