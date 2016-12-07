class Card
  attr_reader :value, :face_up

  def initialize(value = rand(1..10))
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    @value
  end

  def ==(other_card)
    if other_card.is_a?(Card)
      self.value == other_card.value
    end
  end

  def display
    if @face_up
      @value.to_s
    else
      "X"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  # card = Card.new()
  # card2 = Card.new(card.value)
  #
  # p card.display # => "X"
  # card.reveal
  # p card.display # => "num"
  #
  # p card == card2

end
