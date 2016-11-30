require 'rspec'
require 'tdd'

describe Array do
  describe '#my_uniq' do
    subject(:arr) { [1, 2, 3, 4, 4, 3] }

    it 'removes duplicate elements' do
      expect(arr.my_uniq).to eq([1, 2, 3, 4])
    end

    it 'returns elements in order of appearance' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  describe '#two_sum' do

    it 'subarrays are sorted by lowest idx first' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do

    it 'tranposes a 3x3 square' do
      square = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
      expected_result = [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
      expect(square.my_transpose).to eq(expected_result)
    end

    it 'transposes a rectangle' do
      rectangle = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12] ]
      transposed = [ [1, 4, 7, 10], [2, 5, 8, 11], [3, 6, 9, 12] ]
      expect(rectangle.my_transpose).to eq(transposed)
    end
  end

  describe '#stock_picker' do
    subject(:stock_set) { [[10, 2, 0, 3, 6], [1, 9, 11, 3, 20]] }

    it 'find most profitable days to buy/sell' do
      expect(stock_set.stock_picker).to eq([[2, 4], [0, 4]])
    end
  end

end
