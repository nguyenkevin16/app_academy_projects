require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # if @board.over?
    #   if @board.winner != evaluator
    #     # evalulator LOSES the game
    #     # this IS a losing node
    #     true
    #   else
    #     # then evaluator WINS THE game
    #     # this is NOT a losing_node
    #     false
    #   end
    # end

    return @board.over? && @board.winner != evaluator

    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def vacant_pos
    nonoccupied_pos = []

    3.times do |x|
      3.times do |y|
        nonoccupied_pos << [x, y] if @board[[x, y]].nil?
      end
    end

    nonoccupied_pos
  end

  def children
    child_nodes = []

    vacant_pos.each do |child_pos|
      child_board = @board.dup #possible error here, no deep dup
      child_board[child_pos] = @next_mover_mark
      child_nodes << TicTacToeNode.new(child_board, swap_mark, child_pos)
    end

    child_nodes
  end

  def swap_mark
    @next_mover_mark == :x ? :o : :x
  end

end
