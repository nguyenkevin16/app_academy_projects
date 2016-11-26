class Array
  def hash
    self.map(&:hash)
  end
end

class String
  def hash
    self.chars.map { |chr| chr.ord.hash }
  end
end




if __FILE__ == $0
  a = " "
  p a.hash

  b = "ab"
  p b.hash

  # c = [3, 5, -6]
  # p c.hash
  puts a.hash ^ b.hash
  puts a.hash == b.hash
  puts a.hash.eql?(b.hash)
end
