class Shop < ActiveRecord::Base
  has_many :manages
  has_many :users, through: :manages
  has_many :menus
  has_many :days
end
