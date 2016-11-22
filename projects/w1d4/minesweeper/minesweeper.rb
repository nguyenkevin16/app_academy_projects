require_relative 'board'
require_relative 'tile'

class MineSweeper

  def initialize(board = Board.new)
    @board = board
  end

  def play_turn
    prompt_user
    pos = get_pos
    @board[pos].reveal
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
      @board.render
      game_over = play_turn
      system 'clear'
    end

    if @board.won?
      puts "You win!"
    else
      puts "You lose..."
    end

    @board.render
  end

end

if __FILE__ == $0
  m = MineSweeper.new
  m.run
end
