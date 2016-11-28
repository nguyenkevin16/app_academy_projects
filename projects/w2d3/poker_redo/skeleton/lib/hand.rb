require_relative './poker_hands'

class Hand
  include PokerHands

  attr_reader :cards

  def initialize(cards)

  end

  def self.winner(hands)

  end

  def trade_cards(old_cards, new_cards)

  end

  def to_s

  end

  private
  def sort!

  end

  def take_cards(cards)

  end

  def discard_cards(old_cards)

  end

  def has_cards?(old_cards)

  end
end
