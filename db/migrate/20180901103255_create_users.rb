class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :screen_name, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt

      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
