class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :author, foreign_key: { to_table: :users, column: :id }
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
