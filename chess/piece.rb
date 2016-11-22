require_relative 'board'
require 'singleton'

module SlidingPiece
  DIAG_MOVES = {
    up_right: [1, 1],
    up_left: [1, -1],
    down_right: [-1, 1],
    down_left: [-1, -1]
  }

  HORIZ_MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  def moves
    possible_moves = []

    move_dirs.each do |_, v|

      i = 1

      loop do
        new_pos = [@pos[0] + v[0] * i, @pos[1] + v[1] * i]
        # if board[new_pos] == opposing_piece
        # => add to possible_moves
        # => break

        if @board.in_bounds?(new_pos) && @board[new_pos] == @board.null_piece
          possible_moves << new_pos
          i += 1
        else
          break
        end
      end
    end

    possible_moves
  end

end

module SteppingPiece
  def moves
    possible_moves = []

    move_dirs.each do |v|
      new_pos = [@pos[0] + v[0], @pos[1] + v[1]]
      if @board.in_bounds?(new_pos) && @board[new_pos] == @board.null_piece
        possible_moves << new_pos
      end
    end

    possible_moves
  end
end

class Piece
  attr_reader :sym
  attr_accessor :pos

  def initialize(pos, board, color = :white)
    @sym = "p"
    @pos = pos
    @board = board
    @color = color
  end

  def moves

  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @sym = " "
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2657".encode('utf-8') : "\u265D".encode('utf-8')
  end

  def move_dirs
    SlidingPiece::DIAG_MOVES
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2656".encode('utf-8') : "\u265C".encode('utf-8')
  end

  def move_dirs
    SlidingPiece::HORIZ_MOVES
  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2655".encode('utf-8') : "\u265B".encode('utf-8')
  end

  def move_dirs
    SlidingPiece::HORIZ_MOVES.merge(SlidingPiece::DIAG_MOVES)
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2658".encode('utf-8') : "\u265E".encode('utf-8')
  end

  def move_dirs
    [ [1, 2],
      [-1, 2],
      [-1, -2],
      [1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]]
  end
end

class King < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2654".encode('utf-8') : "\u265A".encode('utf-8')
  end

  def move_dirs
    [
      [1, 0],  [1, 1],   [1, -1],
      [0, 1],            [0, -1],
      [-1, 0], [-1, -1], [-1, 1]
    ]
  end

end


class Pawn < Piece
  def initialize(pos, board, color)
    super
    @sym = @color == :white ? "\u2659".encode('utf-8') : "\u265F".encode('utf-8')
  end

  def move_dirs
    @color == :white ? [ [-1, 0] ] : [ [1, 0] ]
  end

  def moves
    [@pos[0] + move_dirs[0], @pos[1] + move_dirs[1]]
  end
end
