require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2

    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        @cups[idx] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 13
  end

  def make_move(start_pos, current_player_name)
    current_pool = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos + 1
    until current_pool.empty?
      if current_player_name == @player1
        @cups[idx] << current_pool.shift unless idx == 13
      elsif current_player_name == @player2
        @cups[idx] << current_pool.shift unless idx == 6
      end

      idx += 1 unless current_pool.empty?
      idx %= 13 if idx > 13
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx - 1].empty?
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[1..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6] == @cups[13]
      :draw
    elsif @cups[6].length > @cups[13].length
      @player1
    else
      @player2
    end
  end
end
