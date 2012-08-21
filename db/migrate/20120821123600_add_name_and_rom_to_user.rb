class AddNameAndRomToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :ROM, :string
  end
end
