class Day < ActiveRecord::Base
  belongs_to :shop
  belongs_to :menu
end
