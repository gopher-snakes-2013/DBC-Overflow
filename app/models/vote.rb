class Vote < ActiveRecord::Base
  validates :direction, :presence => true
  belongs_to :submission

end
