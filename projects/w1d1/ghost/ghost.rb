require_relative "player"

require "byebug"

class Ghost
  attr_reader :current_player, :next_player, :dict, :losses_hash
  attr_accessor :fragment

  def initialize(player1, player2)
    @current_player = player1
    @next_player = player2
    @losses_hash = Hash.new(0)

    dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @dict = Hash.new
    dictionary.each { |word| @dict[word] = "" }

    @fragment = ""
  end

  def display_standings
    @losses_hash.each { |k,v| puts "#{k}: #{v} losses" }
  end

  def run
    until game_over?
      play_round
    end
  end

  def game_over?
    @losses_hash.any? { |k,v| v == 5 }
  end

  def play_round
    until round_over?
      display_standings
      puts @fragment
      puts
      take_turn(current_player)
      next_player!
    end

    @losses_hash[@current_player.name] += 1
    @fragment = ""
  end

  def take_turn(current_player)
    play = current_player.guess
    until valid_play?(play)
      current_player.alert_invalid_guess
      play = current_player.guess
    end

    @fragment << play
  end

  def round_over?
    !@dict[@fragment].nil?
  end

  def next_player!
    @current_player, @next_player = @next_player, @current_player
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    string.length == 1 && alphabet.include?(string.downcase)
  end
end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("player1")
  player2 = Player.new("player2")

  game = Ghost.new(player1, player2)
  game.run
end
