class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor_name
      t.integer :value

      t.timestamps
    end
  end
end
