class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :accessible
      t.boolean :transferable
      t.integer :line_id
      t.string :elevator_status
      t.string :escalator_status

      t.timestamps null: false
    end
  end
end
