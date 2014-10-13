class Day < ActiveRecord::Base
  belongs_to :shop
  has_many :days_menus
  has_many :menus, through: :days_menus
end
