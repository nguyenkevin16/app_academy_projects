require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    self.place_stones

    @name1 = name1
    @name2 = name2
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
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # empties stones
    stones = []
    @cups[start_pos].length.times { stones << @cups[start_pos].shift }

    # distributes stones
    cup_idx = start_pos

    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      # places stones in the correct current player's cups
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
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
    left = @cups[0..5]
    right = @cups[7..12]

    left.all?(&:empty?) || right.all?(&:empty?)
  end

  def winner
    if @cups[6] == @cups[13]
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
