class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      # system 'clear'
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    input = require_sequence

    # if input != @seq
    #   @game_over = true
    # end

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    puts add_random_color
    # sleep 1
    # system ('clear')
  end

  def require_sequence
    # gets.chomp.split(', ')
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations, you've passed this round."
    # sleep 1
  end

  def game_over_message
    puts "Boo, you failed this round."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  s = Simon.new
  s.play
end
