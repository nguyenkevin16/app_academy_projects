require_relative 'card'

require 'byebug'

class ComputerPlayer
  attr_reader :name, :known_cards, :matched_cards, :grid

  def initialize(name = "CPU 1")
    @name = name
    @known_cards = Hash.new(0)
    @matched_cards = []
  end

  def prompt
  end

  def get_input
    guess = rand_guess(2)

    if @known_cards.empty?
      guess
    else

      until !@known_cards.has_key?(guess)
        guess = rand_guess(2)
      end

    end
    
    guess
  end

  def process_guess(guess, card)
    @known_cards[guess] = card.value
  end

  def rand_guess(length)
    rand_guess = [rand(length), rand(length)]

    until @matched_cards.none? { |pos| pos == rand_guess }
      rand_guess = [rand(length), rand(length)]
    end

    rand_guess
  end

  def check_known_cards(pos)
    position = []

    @known_cards.each do |k, v|
      position += k if @board[pos].value == v
    end

    position
  end

  def receive_match(pos1, pos2)
    @matched_cards << pos1
    @matched_cards << pos2
  end

end

if __FILE__ == $0
  player = ComputerPlayer.new
  3.times do
    p player.rand_guess
  end
end
