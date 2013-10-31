class User < ActiveRecord::Base
	has_many :submissions
	validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates :password, length: { minimum: 6 }
end