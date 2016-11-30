require_relative 'board'
require_relative 'tile'
require_relative 'cursor'

class MineSweeper

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def prompt_user
    puts "Please enter a position: "
  end

  def get_pos
    gets.chomp.split(",").collect(&:to_i)
  end

  def run
    game_over = 0

    until game_over == -1 || @board.won?
      @board.render(@cursor.cursor_pos)
      game_over = @cursor.get_input
      system 'clear'
    end

    if @board.won?
      puts "You win!"
    else
      puts "You lose..."
    end

    @board.render(@cursor.cursor_pos)
  end

end

if __FILE__ == $0
  m = MineSweeper.new
  m.run
end
