class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :posts, :user_id

    create_table :post_shares do |t|
      t.integer :post_id
      t.integer :circle_id

      t.timestamps
    end

    add_index :post_shares, :post_id
    add_index :post_shares, :circle_id
    add_index :post_shares, [:post_id, :circle_id], unique: true


  end
end
