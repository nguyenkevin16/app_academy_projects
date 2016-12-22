require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root_node = TicTacToeNode.new(game.board, mark)

    possible_boards = root_node.children
    if possible_boards.any? { |child| child.winning_node?(mark) }
      return child.prev_move_pos
    else
      rand_childen = possible_boards.reject do |child|
        child.losing_node?(mark)
      end

      rand_child = rand_childen.sample
      return rand_child.prev_move_pos
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
