require_relative 'tile'
require 'colorize'
require 'byebug'

class Board
  attr_reader :grid

  def self.from_file(file)
    sudoku_arr = File.readlines(file).map(&:chomp)
    grid = sudoku_arr.map { |line| line.chars.map(&:to_i) }

    grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        value = el
        if value > 0
          grid[row_idx][col_idx] = Tile.new(value, true)
        else
          grid[row_idx][col_idx] = Tile.new(value)
        end
      end
    end

    Board.new(grid)
  end

  def initialize(grid)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def change_tile(pos, value)
    tile = Tile.new(value)
    self[pos] = tile unless self[pos].given
  end

  def solved?
    solved_arr = (1..9).to_a
    (rows + cols + subsquares).all? do |line|
      line.sort == solved_arr
    end
  end

  def rows
    @grid.map { |row| row.map(&:value) }
  end

  def cols
    cols = []
    (0...@grid.length).each do |idx|
      cols << []
      (0...@grid.length).each do |idx2|
        cols[idx][idx2] = @grid[idx2][idx]
      end
    end

    cols.map { |col| col.map(&:value) }
  end

  def subsquares
    subsquares = []

    starting_positions = [
      [0, 0], [0, 3], [0, 6],
      [3, 0], [3, 3], [3, 6],
      [6, 0], [6, 3], [6, 6]
    ]

    starting_positions.each do |pos|
      subsquares << gen_subsqr_pos(pos)
    end

    subsquares.each_with_index do |subsqr, idx|
      subsqr.each_with_index do |pos, idx2|
        subsquares[idx][idx2] = self[pos].value
      end
    end

    subsquares
  end

  def gen_subsqr_pos(pos)
    results = []
    x, y = pos

    (0..2).each do |x_shift|
      (0..2).each do |y_shift|
        results << [x + x_shift, y + y_shift]
      end
    end

    results
  end

  def render
    system('clear')
    print "   "
    9.times { |idx| print "#{idx} " }
    puts "\n  ------------------"

    # @grid.each_with_index do |row, idx|
    #   line = row.map(&:value).join(" ")
    #   puts "#{idx}| #{line}"
    # end

    @grid.each_with_index do |row, idx|
      line = []
      row.each do |tile|
        line << (tile.given ? "#{tile.value.to_s.colorize(:red)}" : "#{tile.value}")
      end
      puts "#{idx}| #{line.join(' ')}"
    end
  end
end

if __FILE__ == $0
  board = Board.from_file("sudoku1.txt")
  p board.solved?
end
