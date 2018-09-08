class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description

      t.datetime :deleted_at

      t.timestamps
    end

    add_index :skills, :user_id
  end
end
