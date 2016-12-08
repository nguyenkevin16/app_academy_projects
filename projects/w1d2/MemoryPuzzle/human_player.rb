class HumanPlayer
  attr_reader :name

  def initialize(name = "Player 1")
    @name = name
  end

  def prompt
    print "Enter a position [x,y]: "
  end

  def get_input
    gets.chomp.split(",").map(&:to_i)
  end

end

if __FILE__ == $0
  # player = HumanPlayer.new("Kevin")
  # player.prompt
  # p player.get_input
end
