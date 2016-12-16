class Map
  def initialize(my_map = [])
    @my_map = my_map
  end

  def assign(key, value)
    my_map << [key, value] if lookup(key).nil?
  end

  def lookup(key)
    return nil if my_map.empty?
    my_map.each { |entry| return entry.last if entry.first == key }
    nil
  end

  def remove(key)
    return nil if lookup(key).nil?

    my_map.delete_if do |entry|
      entry.first == key
    end
  end

  def show
    my_map
  end

  private

  attr_accessor :my_map
end
