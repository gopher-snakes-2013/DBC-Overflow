class Submission < ActiveRecord::Base
  attr_accessible :url, :title
  validates :title, presence: true
  validates :url, presence: true, format: {with: URI::regexp(%w(http https))}
  has_many :comments
end