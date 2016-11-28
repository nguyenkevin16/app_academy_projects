class Player
  attr_reader :bankroll, :hand

  def self.buy_in(bankroll)
    Player.new(bankroll)
  end

  def initialize(bankroll)
    @bankroll = bankroll
  end

  def deal_in(hand)
    @hand = hand
  end

  def respond_bet

  end

  def get_bet

  end

  def get_cards_to_trade

  end

  def take_bet(amount)
    raise "not enough money" if amount > @bankroll
    @bankroll -= amount
    amount
  end

  def receive_winnings(amount)
    @bankroll += amount
  end

  def return_cards
    cards = @hand.cards
    @hand = nil
    cards
  end

  def fold
    true
  end

  def unfold
    false
  end

  def folded?
    @folded = (@bankroll > 0 ? false : true)
  end

  def trade_cards(old_cards, new_cards)

  end

  def <=>(other_player)

  end
end
