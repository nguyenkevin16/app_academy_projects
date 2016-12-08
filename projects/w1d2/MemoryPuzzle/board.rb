require_relative 'card'

require 'byebug'

class Board
  GRID_LENGTH = 2

  attr_reader :deck, :grid

  def initialize
    @grid = Array.new(GRID_LENGTH) { Array.new(GRID_LENGTH) }
    @deck = []
  end

  def setup
    create_cards
    populate
    self
  end

  def create_cards
    while @deck.length < GRID_LENGTH**2 / 2
      card = Card.new
      @deck << card unless @deck.include?(card)
    end

    dup_cards = []
    @deck.each do |orig_card|
      dup_card = Card.new(orig_card.value)
      dup_cards << dup_card
    end

    @deck += dup_cards
    @deck.shuffle!
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def reveal_card(guessed_pos)
    self[guessed_pos].reveal unless self[guessed_pos].face_up
    self[guessed_pos].display
  end

  def render
    system('clear')
    puts "     0    1    2    3"
    @grid.each_with_index do |row, idx|
      line = row.map(&:display)
      puts "#{idx}: #{line}"
    end
  end

  def populate
    @grid.each do |row|
      GRID_LENGTH.times { |idx| row[idx] = @deck.pop }
    end
  end

  def won?
    @grid.flatten.all?(&:face_up)
  end


end

if __FILE__ == $0
  # board = Board.new
  # board.setup
  # board.render
  # pos = [3, 2]
  # board.reveal_card(pos)
  # board.render
end
