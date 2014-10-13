class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.integer :kind
      t.belongs_to :shop

      t.timestamps
    end
  end
end
