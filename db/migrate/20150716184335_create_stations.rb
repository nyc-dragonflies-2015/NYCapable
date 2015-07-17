class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.boolean :accessible
      t.float :latitude
      t.float :longitude
      t.boolean :ramp
      t.boolean :elevator
      t.string :notes
      t.boolean :transferable
      t.string :transferable_to
      t.float :distance_to, :default => 0

      t.timestamps null: false
    end
  end
end
