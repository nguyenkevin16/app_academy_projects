class Hand

  HAND_VALUES = {
    high: 1,
    pair: 2,
    two_pair: 3,
    straight: 4,
    flush: 5,
    three_kind: 6,
    full_house: 7,
    four_kind: 8,
    straight_flush: 9,
    royal_flush: 10
  }.freeze

  SUIT_VALUES = {
    club: 1,
    diamond: 2,
    heart: 3,
    spade: 4
  }.freeze

  faces = (2..10).to_a + [:jack, :queen, :king, :ace]
  values = (1..13).to_a
  FACE_VALUES = faces.zip(values).to_h

  attr_accessor :hand

  def initialize
    @hand = []      # array of card objects
  end

  def hand_cards_value
    @hand.map { |card| FACE_VALUES[card.value] }
  end

  def hand_cards_suit
    @hand.map { |card| card.suit }
  end

  def is_sequence?
    values = hand_cards_value.sort
    i = 0

    values.each_with_index do |value, idx|
      break if values[idx + 1].nil?
      i += 1 if value + 1 == values[idx + 1]
    end

    i == 4
  end

  def same_suit?
    suits = hand_cards_suit
    suits.all? { |suit| suit == suits.first }
  end

  def pair_count
    values = @hand.map { |card| card.value }
    values = values.select { |value| values.count(value) == 2 }
    values.uniq.length
    # @hand.select { |card| card if values.include?(card.value) }
  end

  def add_card(card)
    @hand << card
  end

  def remove_cards

  end

  def royal_flush?
    face_values = [10, :jack, :queen, :king, :ace]

    if same_suit? && is_sequence?
      @hand.each do |card|
        return false unless face_values.include?(card.value)
      end
    end

    true
  end

  def straight_flush?
    same_suit? && is_sequence? && !royal_flush?
  end

  def flush?
    same_suit? && !is_sequence?
  end
end


# HAND_VALUES then FACE_VALUES => then SUIT_VALUES

# hand = [card1, card2, card3, card4, card5]

# hand_values = hand.map { |i| i.value }

# royal_flush?

# same_suit?(cards_arr)
#card_suits = hand.map { |i| i.suit }
#card_suits.all? {|i| i == card_suits[0] }
