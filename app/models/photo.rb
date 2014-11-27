class Photo < ActiveRecord::Base
  belongs_to :shop

  def file_thumb
    "thumb"+file
  end
end
