class CreateRaports < ActiveRecord::Migration
  def change
    create_table :raports do |t|

      t.timestamps
    end
  end
end
