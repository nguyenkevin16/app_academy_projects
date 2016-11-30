require_relative 'board'

class Sudoku
  attr_reader :board, :position, :value

  def initialize(file)
    @board = Board.from_file(file)
  end

  def prompt

    loop do
      puts "Enter a position. (x, y)"
      position = gets.chomp
      puts "Enter a value."
      value = gets.chomp

      break if valid_position?(position) && valid_value(value)
    end

    @position = position.split(",").map(&:to_i)
    @value = value.to_i
  end

  def play
    @board.render
    until @board.solved?
      prompt
      @board.change_tile(@position, @value)
      @board.render
    end

    puts "Congratulations! You win!"
  end

  def valid_position?(pos)
    true
  end
end

if __FILE__ == $0
  game = Sudoku.new("sudoku3.txt")
  game.play
end
