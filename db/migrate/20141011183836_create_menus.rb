class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :drinks
      t.string :desserts
      t.boolean :bread_included
      t.string :text
      t.belongs_to :shop, index: true

      t.timestamps
    end
  end
end
