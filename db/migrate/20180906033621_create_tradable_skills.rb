class CreateTradableSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :tradable_skills do |t|
      t.integer :user_id
      t.integer :skill_id

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :tradable_skills, [:user_id, :skill_id]
  end
end
