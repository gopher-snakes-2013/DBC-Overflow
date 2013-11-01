class Vote < ActiveRecord::Base
  validates_presence_of :direction
  belongs_to :submission
end