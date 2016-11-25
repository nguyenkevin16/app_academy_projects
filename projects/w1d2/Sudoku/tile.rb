class Tile
  attr_reader :given, :value

  def initialize(value, given = false)
    @value = value
    @given = given
  end
end
