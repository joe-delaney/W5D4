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



end