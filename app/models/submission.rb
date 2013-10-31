class Submission < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, format: {with: URI::regexp(%w(http https))}
end