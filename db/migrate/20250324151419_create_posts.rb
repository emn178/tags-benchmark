class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.bigint :user_id

      t.timestamps
      t.index :user_id
    end
  end
end
