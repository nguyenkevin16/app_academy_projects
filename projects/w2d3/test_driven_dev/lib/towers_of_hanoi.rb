require 'byebug'

class Game
  attr_reader :stack

  def play
    until won?
      get_move
      p stack
    end
    p "you won"
  end

  def initialize
    @stack = Array.new(3) { [] }
    @stack[0] += [3, 2, 1]
  end

  def move(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      @stack[end_pos] << @stack[start_pos].pop
    else
      p "incorrect input. try again"
    end
  end

  def valid_move?(start_pos, end_pos)

    return false if @stack[start_pos].empty?
    return true if @stack[end_pos].empty?

    @stack[start_pos].last < @stack[end_pos].last
  end

  def get_move
    input = gets.chomp
    raise 'invalid argument' unless valid_input?(input)
    input = input.split(",").map!(&:to_i)
    # debugger
    move(*input)
  end

  def valid_input?(input)
    input.gsub(/[a..z]/,"") == input
  end

  def won?
    win_arr = [3,2,1]
    if stack[1] == win_arr || stack[2] == win_arr
      return true
    else
      return false
    end
  end
end
