class Submission < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, format: {with: URI::regexp(%w(http https))}
  has_many :comments
end