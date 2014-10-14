class Menu < ActiveRecord::Base
  belongs_to :shop

  has_many :menukinds
  accepts_nested_attributes_for :menukinds

  has_many :courses
  accepts_nested_attributes_for :courses

  has_many :days_menus
  has_many :days, through: :days_menus
end
