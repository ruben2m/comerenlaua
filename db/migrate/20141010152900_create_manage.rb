class CreateManage < ActiveRecord::Migration
  def change
    create_join_table :users, :shops, table_name: :manages do |t|
      t.index :user_id
      t.index :shop_id
    end
  end
end
