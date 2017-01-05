class Tagging < ActiveRecord::Base
  validates :topic_id, :url_id, presence: true
  validate :is_unique?

  def is_unique?
    if Tagging.exists?(topic_id: topic_id, url_id: url_id)
      errors[:tagging] << "already in database"
    end
  end

  belongs_to :url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

  belongs_to :topic,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :TagTopic
end
