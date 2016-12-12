# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  privacy    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base

  validates :body, :user, :privacy, presence: true

  after_initialize :ensure_privacy

  belongs_to :user


  private

  def ensure_privacy
    self.privacy ||= true
  end
end
