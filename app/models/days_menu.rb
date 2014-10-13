class DaysMenu < ActiveRecord::Base
  belongs_to :day
  belongs_to :menu
end
