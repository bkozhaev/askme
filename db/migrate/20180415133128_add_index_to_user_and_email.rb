class AddIndexToUserAndEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :user, :email, unique: true
  end
end
