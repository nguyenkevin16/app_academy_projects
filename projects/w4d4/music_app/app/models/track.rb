# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  TRACK_TYPES = %w(bonus regular).freeze

  validates :name, :album_id, :track_type, :lyrics, presence: true
  validates :track_type, inclusion: TRACK_TYPES

  belongs_to :album
  has_many :notes

  has_one :band,
    through: :album,
    source: :band
end
