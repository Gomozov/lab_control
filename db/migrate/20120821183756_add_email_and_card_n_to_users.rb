class AddEmailAndCardNToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :cardN, :string
  end
end
