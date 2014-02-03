class Task < ActiveRecord::Base
  belongs_to :day
  belongs_to :goal
end
