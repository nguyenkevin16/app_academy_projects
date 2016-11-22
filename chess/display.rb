require 'colorize'
require_relative 'cursor'
require_relative 'board'
require 'byebug'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    header = "  "
    8.times { |x| header << " #{x} " }
    puts header

    @board.board.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |piece, col_idx|
        if @cursor.cursor_pos == [row_idx, col_idx]
          print " #{piece} ".colorize(:background => :green)
        else
          print (row_idx + col_idx).even? ? " #{piece} "
            : " #{piece} ".colorize(:color => :white, :background => :black)
        end
      end

      puts
    end
  end

  def display_loop
    loop do
      system("clear")
      render
      @cursor.get_input
    end
  end

end

if __FILE__ == $0
  b = Board.new
  d = Display.new(b)
  d.display_loop

  # p String.colors
end
