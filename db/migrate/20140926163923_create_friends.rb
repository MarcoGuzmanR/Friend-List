class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.integer :member_id

      t.timestamps
    end
  end
end
