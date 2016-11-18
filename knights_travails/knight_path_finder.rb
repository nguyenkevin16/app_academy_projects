require_relative '../skeleton/lib/00_tree_node'

class KnightPathFinder
  def initialize(start_pos)
    @visited_pos = [start_pos]
    @move_tree = PolyTreeNode.new(start_pos)
  end

  def find_path(end_pos)

  end

  def build_move_tree
    # Implement a BF algorithm
  end

  def valid_moves(pos)

  end

  def new_move_positions(pos)


  end

  def trace_path_back(curr_node)

  end

end
