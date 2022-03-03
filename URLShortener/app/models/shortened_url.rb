require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence:true
  validates :long_url, uniqueness:true

  def self.random_code
    temp = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => temp)
      temp = SecureRandom.urlsafe_base64
    end
    temp
  end

  def self.create_short_url(user, long_url_input)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url_input, short_url: short_url, user_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits.select(:user_id).where("created_at > ?", 10.minute.ago).distinct.count
  end
end