class Menu < ActiveRecord::Base
  belongs_to :shop

  has_many :menukinds, dependent: :destroy
  accepts_nested_attributes_for :menukinds, allow_destroy: true

  has_many :courses, dependent: :destroy
  accepts_nested_attributes_for :courses, allow_destroy: true

  has_many :days_menus
  has_many :days, through: :days_menus
end
