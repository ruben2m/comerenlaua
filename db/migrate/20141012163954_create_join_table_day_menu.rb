class CreateJoinTableDayMenu < ActiveRecord::Migration
  def change
    create_join_table :days, :menus do |t|
      t.index :day_id
      t.index :menu_id
    end
  end
end
