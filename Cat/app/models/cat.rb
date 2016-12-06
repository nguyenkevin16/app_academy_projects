class Cat < ActiveRecord::Base
  COLORS = %w(black, brown, auburn, blonde, calico, white, grey, orange)

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]

  def age
    @age = Date.today - @birth_date
  end

end
