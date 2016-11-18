require_relative '../skeleton/lib/00_tree_node'

require 'byebug'

class KnightPathFinder
  BOARD_SIZE = 8

  def initialize(start_pos)
    @visited_pos = [start_pos]
    @move_tree_root = PolyTreeNode.new(start_pos)
  end

  def find_path(end_pos)
    target_node = @move_tree_root.dfs(end_pos)
    path = trace_path_back(target_node)
  end

  def trace_path_back(curr_node)
    next_node = curr_node.parent
    return [curr_node.value] if next_node.nil?

    trace_path_back(next_node) << curr_node.value
  end

  def build_move_tree
    # Implement a BF algorithm
    queue = [@move_tree_root]

    until queue.empty?

      parent = queue.shift
      children_pos = new_move_positions(parent.value)

      children_pos.each do |child_pos|
        child = PolyTreeNode.new(child_pos)
        parent.add_child(child)
        queue << child
      end

    end

    @move_tree_root
  end

  def new_move_positions(pos)
    valid_pos = self.class.valid_moves(pos)

    new_moves = valid_pos.reject { |new_pos| @visited_pos.include?(new_pos) }

    @visited_pos += new_moves

    new_moves
  end

  def self.valid_moves(pos)
    deltas = [
      [-2, -1], [-2, 1],
      [2,  -1], [2,  1],
      [-1, -2], [-1, 2],
      [1,  -2], [1,  2],
    ]

    valid_pos = []

    deltas.each do |delta|
      new_pos = [pos[0] + delta[0], pos[1] + delta[1]]
      if new_pos.all? { |el| el >= 0 && el < BOARD_SIZE }
        valid_pos << new_pos
      end
    end
    valid_pos
  end

end

if __FILE__ == $0
  k = KnightPathFinder.new([0, 0])
  k.build_move_tree
  p k.find_path([7,6])
end
