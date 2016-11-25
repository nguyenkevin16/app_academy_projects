class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    cards = deck.take(2)

    Hand.new(cards)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0

    @cards.each do |card|
      if card.value == :ace # is an ace
        if points + 11 > 21
          points += 1
        else
          points += 11
        end
      else
        points += card.blackjack_value
      end
    end

    points
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    return true if other_hand.points < self.points
    return false if other_hand.points >= self.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
