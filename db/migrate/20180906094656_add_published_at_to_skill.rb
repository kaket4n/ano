class AddPublishedAtToSkill < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :published_at, :datetime, after: :description

    add_index :skills, [:user_id, :published_at]
  end
end
