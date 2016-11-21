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
    new_arr = []
    self.each do |el|
      new_arr += (el.is_a?(Array) ? el.my_flatten : [el])
    end
    new_arr
  end

  def my_zip(*zip_files)
    zipped_arr = []

    self.each_index do |idx|
      sub_arr = [self[idx]]

      zip_files.each do |zip_file|
        sub_arr << (zip_file.nil? ? nil : zip_file[idx])
      end

      zipped_arr << sub_arr
    end

    zipped_arr
  end

  def my_rotate(shift = 1)
    arr = self.dup
    num = (shift > 0 ? shift : shift * -1)

    num.times do
      if shift > 0
        arr << arr.shift
      else
        arr.unshift(arr.pop)
      end
    end

    arr
  end

  def my_join(seperator = "")
    str = ""
    self.each { |el| str << el + seperator }
    str
  end

  def my_reverse
    reversed_arr = []

    (self.length - 1).downto(0).each do |idx|
      reversed_arr << self[idx]
    end

    reversed_arr
  end

end

if __FILE__ == $0

end
