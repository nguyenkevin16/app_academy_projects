# == Schema Information
#
# Table name: albums
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  recorded_location :string           not null
#  band_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Album < ActiveRecord::Base
  RECORDED_LOCATION_TYPES = %w(live studio).freeze

  validates :name, :recorded_location, :band_id, presence: true
  validates :recorded_location, inclusion: RECORDED_LOCATION_TYPES

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
