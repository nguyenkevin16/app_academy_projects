class Tile

  def initialize(bombed = false, board, pos)
    @bombed, @board = bombed, board
    @flagged, @revealed = false, false
    @n_bombs = 0
    @pos = pos
  end

  def reveal
    @revealed = true
    @bombed ? -1 : count_neighbor_bombs
  end

  def count_neighbor_bombs
    bomb_count = 0
    neighbors.each { |n_pos| bomb_count += 1 if @board[n_pos].bombed }
    @n_bombs = bomb_count
  end

  def neighbors
    deltas = [
      [-1,-1], [-1,0], [-1,1],
      [0, -1],         [0, 1],
      [1, -1], [1, 0], [1, 1]
    ]

    n_poses = deltas.map { |n| [n[0] + @pos[0], n[1] + @pos[1]] }
    n_poses.select do |n_pos|
      n_pos.all? { |val| val >= 0 && val < @board.size }
    end
  end

  def to_s
    if @revealed
      @bombed ? "*" : @n_bombs
    else
      "_"
    end
  end

end
