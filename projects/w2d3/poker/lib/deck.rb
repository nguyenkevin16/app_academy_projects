require_relative 'card'

class Deck
  attr_reader :cards, :dealt_cards

  def self.build_deck
    cards = []

    values = (2..10).to_a + [:jack, :queen, :king, :ace]
    suits = [:diamond, :heart, :club, :spade]

    suits.each do |suit|
      values.each do |value|
        cards << Card.new(suit, value)
      end
    end

    Deck.new(cards)
  end

  def initialize(cards = [])
    @cards = cards
    @dealt_cards = []
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal
    if @cards.empty?
      nil
    else
      dealt_card = @cards.shift
      @dealt_cards << dealt_card
      dealt_card
    end
  end

  def reset_deck
    @cards += @dealt_cards
    @dealt_cards = []
  end
end
