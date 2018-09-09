class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :requested_order_id, null: false
      t.integer :responded_order_id, null: false
      t.integer :status, default: 0

      t.datetime :canceled_at
      t.datetime :deleteed_at

      t.timestamps
    end
  end
end
