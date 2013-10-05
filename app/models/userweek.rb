class Userweek < ActiveRecord::Base
  attr_accessible :jiras, :summary, :user_id, :week_id
  
  belongs_to :user
  belongs_to :week
end
