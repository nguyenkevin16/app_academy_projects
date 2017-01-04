class Tagging < ApplicationRecord
  validates :todo, :tag, presence: true

  belongs_to :todo
  belongs_to :tag
end
