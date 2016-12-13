require 'rspec'
require 'towers_of_hanoi'
require 'byebug'

describe Game do
  subject(:game) { Game.new }

  describe '#initialize' do

    it 'initializes an array with 3 sub arrays' do
      expect(game.stack.length).to eq(3)
    end

    it 'initialized stack is an Array' do
      expect(game.stack.class).to eq(Array)
    end

    it 'first stack contains starting pieces' do
      expect(game.stack.first).to eq([3, 2, 1])
    end

    it 'other stacks are empty' do
      expect(game.stack[1..-1]).to eq([[], []])
    end
  end

  describe '#move' do
    before(:each) { game.move(0, 1) }

    it 'properly moves a disk' do
      game.move(0, 2)
      expect(game.stack).to eq([[3], [1], [2]])
    end
  end

  describe '#valid_move?' do
    before(:each) { game.move(0, 1) }

    it 'return false if larger disk tries to place on smaller disk' do
      expect( game.valid_move?(0, 1) ).to be_falsey
    end

    it 'return false if starting stack is empty' do
      expect( game.valid_move?(2, 0) ).to be_falsey
    end

    it 'return true if is valid move' do
      expect( game.valid_move?(0, 2) ).to be_truthy
    end
  end

  describe '#valid_input?' do

    it 'should return false when position is not an integer' do
      expect(game.valid_input?("asdf")).to be_falsey
    end
  end


end
