require_relative 'tile'

class Board
  attr_reader :size

  def default_grid
    Array.new(9) { Array.new }
  end

  def initialize(grid = default_grid)
    @grid = grid
    @size = grid.length
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def render
    puts "  #{(0...size).to_a.join(' ')}"

    @grid.each_with_index do |row, idx|
      puts "#{idx} #{row.join(' ')}"
    end

    nil
  end

  def populate
    size.times do |x|
      size.times do |y|
        is_a_bomb = rand(5) == 0
        @grid[x] << Tile.new(is_a_bomb, self, [x, y])
      end
    end
  end
end
