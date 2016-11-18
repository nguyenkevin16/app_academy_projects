class Board

  def default_grid
    Array.new(9) { Array.new(9) }
  end

  def initialize(grid = default_grid)
    @grid = grid
    @size = grid.length
    # populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def populate


  end

end
