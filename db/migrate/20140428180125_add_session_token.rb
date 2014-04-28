class AddSessionToken < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string
    add_index :users, :session_token
    add_index :users, :username
  end
end
