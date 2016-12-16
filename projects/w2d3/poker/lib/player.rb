class Player

  attr_accessor :hand, :pot

  def initialize
    @hand = Hand.new
    @pot = 0
  end

  def discard(card)
    @hand.remove_cards(card)
  end

  def ask_discard
    prompt_discard
    response = gets.chomp
    response
  end

  def prompt_discard
    p 'what cards would you like to discard?'
  end

  def ask_options
    prompt_options
    response = gets.chomp
    response
  end

  def prompt_options
    p "fold, see or raise?"
  end
end
