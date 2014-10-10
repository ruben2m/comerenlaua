class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :title
      t.string :manager
      t.string :phone
      t.string :email
      t.string :timetable

      t.timestamps
    end
  end
end
