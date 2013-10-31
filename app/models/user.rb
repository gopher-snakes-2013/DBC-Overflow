class User < ActiveRecord::Base
	has_many :submissions
	validates_presence_of :username, :password
end