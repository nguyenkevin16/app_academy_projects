require_relative './player'
require_relative './deck'

class Game
  attr_reader :players, :pot, :deck

  def initialize
    @deck = Deck.new
    @pot = 0
    @players = []
  end

  def play

  end

  def play_round

  end

  def unfold_players

  end

  def deal_cards
    @players.each do |player|
      player.deal_in(@deck.deal_hand) unless player.bankroll == 0
    end
  end

  def take_bets

  end

  def trade_cards
    
  end

  def end_round

  end

  def winner

  end

  def show_hands

  end

  def add_to_pot(amount)
    @pot += amount
  end

  def game_over?
    broke_players = @players.count { |player| player.bankroll == 0 }
    broke_players == (@players.length - 1) ? true : false
  end

  def add_players(n, buy_in)
    n.times do
      @players << Player.new(buy_in)
    end
  end
end

def test

end
