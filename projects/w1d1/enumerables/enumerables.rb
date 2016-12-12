require 'byebug'

class Array
  def my_each(&prc)
    self.count.times { |idx| prc.call(self[idx]) }
  end

  def my_select(&prc)
    array = []
    self.my_each { |el| array << el if prc.call(el) }
    array
  end

  def my_reject(&prc)
    array = []
    self.my_each { |el| array << el unless prc.call(el) }
    array
  end

  def my_any?(&prc)
    flag = false
    self.my_each { |el| flag = true if prc.call(el) }
    flag
  end

  def my_all?(&prc)
    flag = true
    self.my_each { |el| flag = false unless prc.call(el) }
    flag
  end

  def my_flatten
    result = []

    self.count.times do |i|
      if self[i].is_a?(Integer)
        result << self[i]
      else
        #result = result + self[i].my_flatten
        result << self[i].my_flatten
      end
    end

    result
  end

  def my_zip(*arg)
    result = []

    self.count.times do |i|
      new_arr = [self[i]]

      arg.my_each do |el|
        new_arr << el[i]
      end

      result << new_arr
    end

    result
  end

  def my_rotate(shift = 1)
    new_arr = self.dup
    shift.abs.times do
      if shift > 0
        new_arr << new_arr.shift
      else
        new_arr.unshift(new_arr.pop)
      end
    end

    new_arr
  end

  def my_join(default = "")
    string = ""

    self.count.times do |i|
      string << self[i]
      string << default unless i == self.count - 1
    end

    string
  end

  def my_reverse
    result = []

    idx = self.count - 1
    while idx >= 0
      result << self[idx]
      idx -= 1
    end

    result
  end

end
