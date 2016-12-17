require_relative 'tile'
require 'colorize'

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

  def render(cursor_pos)
    puts "   #{(0...size).to_a.join(' ')}"
    # puts "  #{'__' * size}"

    @grid.each_with_index do |row, idx1|
      print "#{idx1}| "

      row.each_with_index do |tile, idx2|

        if cursor_pos == [idx1, idx2]
          print tile.to_s.colorize(background: :red) + " "
        else
          print "#{tile} "
        end

        # puts "#{idx}| #{row.join(' ')}".colorize(background: :magenta)
      end

      puts
    end

    nil
  end

  def won?
    @grid.all? do |row|
      row.all? do |tile|
        tile.revealed unless tile.bombed
        # tile.revealed == false || tile.bombed == false
      end
    end
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
