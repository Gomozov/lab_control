class AddBodyToRaports < ActiveRecord::Migration
  def change
    add_column :raports, :body, :string
  end
end
