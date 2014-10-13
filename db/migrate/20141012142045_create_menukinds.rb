class CreateMenukinds < ActiveRecord::Migration
  def change
    create_table :menukinds do |t|
      t.string :text
      t.decimal :price
      t.belongs_to :menu, index: true

      t.timestamps
    end
  end
end
