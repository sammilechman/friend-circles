class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end

    create_table :circle_memberships do |t|
      t.integer :user_id
      t.integer :circle_id
      t.timestamps
    end

    add_index :circles, :owner_id
    add_index :circles, [:owner_id, :name], unique: true
    add_index :circle_memberships, :circle_id
    add_index :circle_memberships, :user_id
  end
end
