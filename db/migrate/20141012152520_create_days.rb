class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_of_week
      t.belongs_to :shop, index: true
      t.belongs_to :menu, index: true

      t.index [:id, :day_of_week], unique: true

      t.timestamps
    end
  end
end
