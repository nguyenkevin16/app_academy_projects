require 'colorize'

class Tile
  attr_reader :bombed, :revealed

  def initialize(bombed = false, board, pos)
    @bombed, @board = bombed, board
    @flagged, @revealed = false, false
    @n_bombs = 0
    @pos = pos
  end

  def reveal
    return if @flagged
    @revealed = true
    @bombed ? -1 : count_neighbor_bombs
  end

  def toggle_flag
    @flagged = (@flagged ? false : true)
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

    # Add center_pos to each element of deltas array to create neighbors
    n_poses = deltas.map { |n| [n[0] + @pos[0], n[1] + @pos[1]] }

    # Return only neighbors within the board
    n_poses.select do |n_pos|
      n_pos.all? { |val| val >= 0 && val < @board.size }
    end
  end

  def to_s
    if @flagged
      "\u2690".encode('utf-8').colorize(color: :black, background: :light_cyan)
    elsif @revealed
      if @bombed
        "\u2620".encode('utf-8').colorize(:red)
      elsif @n_bombs == 0
        "\u2610".encode('utf-8').colorize(:light_cyan)
      else
        @n_bombs.to_s.colorize(:light_cyan)
      end
    else
      " "
    end
  end

end
