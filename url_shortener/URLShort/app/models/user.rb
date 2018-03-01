class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many :submits,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: :ShortenedUrl

  has_many :visits,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :Visit

  has_many :visited_urls,
    through: :visits,
    source: :shortened_url

end
