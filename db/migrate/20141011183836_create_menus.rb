class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.boolean :bread_included
      t.string :text
      t.belongs_to :shop, index: true

      t.index [:id, :day_of_week], unique: true

      t.timestamps
    end
  end
end
