require_relative 'piece'
require_relative 'display'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new }
    populate
  end

  def populate
    0.upto(7) do |idx|
      piece_row = []
      if idx >= 2 && idx < 6
        8.times { piece_row << nil }
      else
        8.times { piece_row << Piece.new([1,1], self) }
      end
      @board[idx] += piece_row
    end
  end

  def move_piece(start_pos, end_pos)
    raise if self[start_pos].nil? || !in_bounds?(end_pos)
    rescue
      puts "Invalid position."

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord >= 0 && coord <= 7 }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @board[row][col] = mark
  end
end

if __FILE__ == $0
  b = Board.new
  d = Display.new(b)
  d.render
  p b[[1, 1]].moves
end
