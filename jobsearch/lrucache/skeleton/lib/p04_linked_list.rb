class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key }
    nil
  end

  def include?(key)
    any? { |node| node.key == key }
  end

  def insert(key, val)
    insert_link = Link.new(key, val)
    prev_link = @tail.prev

    prev_link.next = insert_link
    insert_link.next = @tail
    insert_link.prev = prev_link
    @tail.prev = insert_link
  end

  def remove(key)
    node_to_remove = @head.next

    until node_to_remove.key == key
      node_to_remove = node_to_remove.next
    end

    node_to_remove.remove
  end

  def each
    node_to_check = @head.next

    until node_to_check == @tail
       yield(node_to_check)
      node_to_check = node_to_check.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
