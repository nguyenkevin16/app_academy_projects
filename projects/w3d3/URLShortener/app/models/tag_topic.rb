class TagTopic < ActiveRecord::Base
  validates :topic, presence: true, uniqueness: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :url

  has_many :visits,
    through: :urls,
    source: :visits

  def most_popular_urls(n)
    num_urls = urls.count
    n = num_urls if n > num_urls

    # order the urls by # of likes DESC
    url_visit_counts = Hash.new

    # urls = self.urls.include(:visits)
    urls.each do |url|
      url_visit_counts[url] = url.num_clicks
    end

    websites = url_visit_counts.sort_by { |url, visits| visits }.pop(n)
    websites.map { |pair| pair[0] }
  end
end


# n + 1 query
