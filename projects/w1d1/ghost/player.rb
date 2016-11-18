class Player
  attr_reader :name

  def initialize(name = "player1")
    @name = name
  end

  def guess
    puts "Enter a letter or exit: "
    guess = gets.chomp
    exit(1) if guess == "exit"
    guess
  end

  def alert_invalid_guess
    puts "Invalid entry! Please try again: "
  end
end
