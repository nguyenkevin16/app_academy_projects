class Player

  def initialize(name)
    @name = name
    @hand = nil
  end

  def get_input(current_card)
    prompt
    
  end


end

class Game

  def initialize
    @players = []
    @deck
    @current_card
  end

  def self.deal_cards(deck)

  end

  def play_round
    @players.each
      player.get_input(show_current_card)
    end
  end
end
