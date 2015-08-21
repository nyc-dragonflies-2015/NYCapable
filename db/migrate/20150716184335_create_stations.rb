class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.boolean :accessible, default: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.boolean :ramp, default:false
      t.boolean :elevator, default: false
      t.string :notes, default: ""
      t.boolean :transferable, default: false
      t.string :transferable_to, default: "none"
      t.float :distance_to

      t.timestamps null: false
    end
  end
end
