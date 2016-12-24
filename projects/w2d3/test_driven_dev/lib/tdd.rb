class Array
  def my_uniq
    uniq_arr = []
    i = 0

    while i < self.length
      uniq_arr << self[i] unless uniq_arr.include?(self[i])
      i += 1
    end

    uniq_arr
  end

  def two_sum
    zero_sum_arr = []

    (0...self.length - 1).each do |idx1|
      ((idx1 + 1)...self.length).each do |idx2|
        zero_sum_arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end

    zero_sum_arr
  end

  def my_transpose
    tranposed = []

    self[0].each_index do |idx1|
      sub_arr = []

      self.each_index do |idx2|
        sub_arr << self[idx2][idx1]
      end

      tranposed << sub_arr
    end

    tranposed
  end

  def stock_picker
    total_arr = []

    self.each do |stock|
      min = stock.find_index(stock.min)
      max = stock.find_index(stock[(min + 1)..-1].max)

      total_arr << [min, max]
    end

    total_arr
  end
end
