class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :text
      t.belongs_to :menu, index: true

      t.timestamps
    end
  end
end
