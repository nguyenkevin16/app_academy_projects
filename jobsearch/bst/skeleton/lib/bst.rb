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
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
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
    @root = BinarySearchTree.delete!(@root, value)
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
    return node if value == node.value

    if value <= node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end
  end

  # Root, left, right
  def self.preorder!(node)
    return [] unless node

    nodes = []
    nodes << node.value
    nodes += BinarySearchTree.preorder!(node.left) if node.left
    nodes += BinarySearchTree.preorder!(node.right) if node.right
    nodes
  end

  # Left, root, right
  def self.inorder!(node)
    return [] unless node

    nodes = []
    nodes += BinarySearchTree.inorder!(node.left) if node.left
    nodes << node.value
    nodes += BinarySearchTree.inorder!(node.right) if node.right
    nodes
  end

  # Left, right, root
  def self.postorder!(node)
    return [] unless node

    nodes = []
    nodes += BinarySearchTree.postorder!(node.left) if node.left
    nodes += BinarySearchTree.postorder!(node.right) if node.right
    nodes << node.value
    nodes
  end

  def self.height!(node)
    return -1 unless node

    left = BinarySearchTree.height!(node.left)
    right = BinarySearchTree.height!(node.right)

    if left >= right
      height = left
    else
      height = right
    end

    1 + height
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
    return nil unless node
    remove_node, parent_node = node, node

    remove_node = node.left if node.left

    until remove_node.left.nil?
      remove_node = remove_node.left
      parent_node = parent_node.left
    end

    parent_node.left = remove_node.right if remove_node.right
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      temp = node
      node = temp.right.min
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    end

    node
  end
end
