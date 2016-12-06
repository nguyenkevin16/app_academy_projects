class Cat < ActiveRecord::Base
  COLORS = ["black", "brown", "auburn", "blonde", "calico", "white", "grey", "orange"]

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: ["M", "F"] }

  def age
    @age = Date.today - @birth_date
  end
end
