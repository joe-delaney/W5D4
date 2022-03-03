class TagTopic < ApplicationRecord

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

  def popular_links
    visits.select(:short_url_id).count
  end

end