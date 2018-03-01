# require_relative 'secure_random'
require 'base64'
require 'pg'
require 'singleton'

CONNECTION = PG::Connection.open(:dbname => 'URLShort_development')


class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id

  has_many :visits,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user


  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.create_short_url(user, long_url)
    random_url = ShortenedUrl.random_code

    while ShortenedUrl.exists?(:short_url => random_url)
      random_url = ShortenedUrl.random_code
    end

    ShortenedUrl.create!(submitter_id: user.id, :short_url => random_url, :long_url => long_url)
  end

  def num_clicks
    self.visits.length
  end

  def num_uniques
    self.visitors.uniq.length
  end

  def num_recent_uniques
    (visits.select(:user_id)
      .where("created_at > ?", 10.minutes.ago)).count

  end

end
