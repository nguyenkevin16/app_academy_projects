class Array
  def my_each(&prc)
    self.length.times { |idx| prc.call(self[idx]) }
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each { |el| arr << el if prc.call(el) }
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each { |el| arr << el unless prc.call(el) }
    arr
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }
    true
  end

  def my_flatten

  end
end
