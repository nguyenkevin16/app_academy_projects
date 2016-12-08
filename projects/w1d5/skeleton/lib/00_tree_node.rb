require 'byebug'

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(new_parent)
    # return nil if new_parent.nil?

    # Remove child from original parent
    self.parent.children.delete(self) unless self.parent.nil?

    # Set child's parent pointer to new parent
    @parent = new_parent

    # Update new parent's children
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "ERROR!" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      subtree_result = child.dfs(target)
      return subtree_result unless subtree_result.nil?
    end

    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      first = queue.shift
      return first if first.value == target
      first.children.each { |child| queue << child }
    end

    nil
  end
end
