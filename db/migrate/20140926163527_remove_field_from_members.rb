class RemoveFieldFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :email, :string
  end
end
