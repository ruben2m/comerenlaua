class Menu < ActiveRecord::Base
  belongs_to :shop
  has_many :menukinds
end
