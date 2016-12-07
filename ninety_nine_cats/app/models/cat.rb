# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  COLORS = ["black", "brown", "auburn", "blonde", "calico", "white", "grey", "orange"]

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: ["M", "F"] }

  has_many :requests, dependent: :destroy,
    class_name: :CatRentalRequest

  def age
    @age = Date.today - @birth_date
  end
end
