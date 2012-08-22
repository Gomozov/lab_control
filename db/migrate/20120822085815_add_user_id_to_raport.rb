class AddUserIdToRaport < ActiveRecord::Migration
  def change
    add_column :raports, :user_id, :integer
  end
end
