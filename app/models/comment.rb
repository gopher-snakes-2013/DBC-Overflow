class Comment < ActiveRecord::Base
  attr_accessible :content, :submission
  validates_presence_of :content
  belongs_to :submission
end
