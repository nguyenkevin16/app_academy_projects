class Cat2 < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]

  COLORS = %w(black, brown, auburn, blonde, calico, white, grey, orange)

  def age
    @age = Date.today - @birth_date
  end

end
