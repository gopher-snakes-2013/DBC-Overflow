class Submission < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  attr_accessible :url, :title
  validates :title, presence: true
  validates :url, presence: true, format: {with: URI::regexp(%w(http https))}
end