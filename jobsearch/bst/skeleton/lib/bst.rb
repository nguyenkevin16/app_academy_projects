class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @left, @right = nil
    @value = value
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root
      BinarySearchTree.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder

  end

  def postorder

  end

  def preorder

  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return nil if node.right.nil? && node.left.nil?
    return node if value == node.value

    BinarySearchTree.find!(node.left, value)
    BinarySearchTree.find!(node.right, value)
  end

  def self.preorder!(node)

  end

  def self.inorder!(node)

  end

  def self.postorder!(node)

  end

  def self.height!(node)
    return -1 unless node
    return 0 if node.right.nil? && node.left.nil?
    return 1 if node.right || node.left

    left_depth, right_depth = 0
    left_depth + BinarySearchTree.height!(node.left)
    right_depth + BinarySearchTree.height!(node.right)

    p right_depth
    p left_depth

    right_depth > left_depth ? right_depth : left_depth
  end

  def self.max(node)
    return node unless node.right
    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return node unless node.left
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end
end
