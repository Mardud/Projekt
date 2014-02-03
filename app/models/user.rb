class User < ActiveRecord::Base
  has_many :weeks
  has_many :goals
  validates_presence_of :name
end
