require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    header = "  "
    8.times { |x| header << " #{x} " }
    puts header
    @board.board.each_with_index do |row, idx|
      puts "#{idx} #{row.map(&:to_s)}"
    end
  end

end

if __FILE__ == $0
  b = Board.new
  d = Display.new(b)
  d.render

end
