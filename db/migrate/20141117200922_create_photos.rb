class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :date
      t.string :file
      t.belongs_to :shop, index: true

      t.timestamps
    end
  end
end
