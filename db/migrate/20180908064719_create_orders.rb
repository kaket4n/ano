class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :skill_id

      t.datetime :canceled_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
