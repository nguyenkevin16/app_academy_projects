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
    unless start_pos > 12 && start_pos < 1
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    # empties stones
    stones = []
    @cups[start_pos].length.times { stones << @cups[start_pos].shift }

    # distributes stones
    curr_pos = start_pos + 1
    other_side = (current_player_name == @name1 ? 13 : 6)
    stones.length.times do
      @cups[curr_pos] << stones.shift unless curr_pos == other_side
      curr_pos += 1
      curr_pos %= 13
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
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
  end
end
