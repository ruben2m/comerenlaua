class Menu < ActiveRecord::Base
  belongs_to :shop
  has_many :menukinds
  has_many :courses
  has_many :days_menus
  has_many :days, through: :days_menus
end
