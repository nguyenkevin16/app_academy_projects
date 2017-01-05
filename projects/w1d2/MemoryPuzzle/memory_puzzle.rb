require_relative 'card'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class MemoryPuzzle
  attr_reader :player, :board, :prev_guess

  def initialize(player = HumanPlayer.new, board = Board.new)
    @board = board.setup
    @player = player
    @prev_guess = nil
  end

  def play
    until @board.won?
      @board.render
      @player.prompt
      guess = @player.get_input
      make_guess(guess)
      # @player.process_guess(guess, @board[guess])
    end

    @board.render
    puts "Congrats!"
  end

  def make_guess(guess)
    if @board[guess].face_up
      puts "Already Revealed"
      sleep(1)
    elsif @prev_guess.nil?
      @board[guess].reveal
      @prev_guess = guess
    else
      if @board[guess] == @board[@prev_guess]
        @board[guess].reveal
      else
        @board[guess].reveal
        @board.render
        sleep(2)
        @board[guess].hide
        @board[@prev_guess].hide
      end

      @prev_guess = nil
    end
  end
end

if __FILE__ == $0
  puzzle = MemoryPuzzle.new
  puzzle.play
end
