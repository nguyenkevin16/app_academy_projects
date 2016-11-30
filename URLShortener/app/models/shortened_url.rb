class ShortenedUrl < ActiveRecord::Base
  validates :user_id, presence: true
  validates :long_url, presence:true, uniqueness: true

end
