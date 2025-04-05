class CreatePgPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :pg_posts do |t|
      t.string :title
      t.bigint :user_id
      t.string :tags, array: true, default: []

      t.timestamps

      t.index :user_id
      t.index :tags, using: "gin"
    end
  end
end
