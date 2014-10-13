class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_of_week
      t.belongs_to :shop

      t.index [:id, :day_of_week], unique: true

      t.timestamps
    end
  end
end
