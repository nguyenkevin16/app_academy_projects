require_relative "player"

require "byebug"

class Ghost
  attr_reader :dict, :losses_hash, :players
  attr_accessor :fragment, :current_player, :next_player

  def initialize(players)
    @current_player = players.first
    @next_player = players[1]
    @players = players
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
      if player_out?
        @losses_hash.delete(@players.last.name)
        @players.pop
      end
      @players.each {|player| puts player.name}
    end
  end

  def game_over?
    @players.count == 1
  end

  def player_out?
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

    @losses_hash[@players.last.name] += 1
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
    # players_rotated = @players.dup.rotate
    # @current_player = players_rotated.first
    # @next_player = players_rotated[1]
    # puts players_rotated
    @players.rotate!
    @current_player = players.first
    @next_player = players[1]
    puts @next_player
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    string.length == 1 && alphabet.include?(string.downcase)
  end
end

if __FILE__ == $PROGRAM_NAME
  str_arr = []
  puts "Enter player or enter X to begin"
  name = gets.chomp
  until name == "X"
    str_arr << name
    name = gets.chomp
  end

  players = []
  str_arr.each do |name|
    players << Player.new(name)
  end

  game = Ghost.new(players)
  game.run
end
