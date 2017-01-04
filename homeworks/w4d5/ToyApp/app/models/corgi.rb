# == Schema Information
#
# Table name: corgis
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Corgi < ActiveRecord::Base
  # has_many :toys, as: :toyable

  include Toyable
end
