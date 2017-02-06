require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      link = @map[key]
      self.update_link!(link)
      link.val
    else
      self.calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    new_link = @store.insert(key, val)
    @map[key] = new_link

    self.eject! if self.count > @max
    val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    link.remove
    @store.insert(link.key, link.val)
  end

  def eject!
    rm_link = @store.first
    rm_link.remove
    @map.delete(rm_link.key)

    nil
  end
end
