class Week < ActiveRecord::Base
  attr_accessible :endDate, :name, :startDate, :status

  has_many :userweeks, dependent: :destroy
  has_many :users, :through => :userweeks

  default_scope order: 'weeks.created_at DESC'
end
