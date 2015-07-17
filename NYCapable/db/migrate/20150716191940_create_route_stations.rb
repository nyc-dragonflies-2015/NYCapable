class CreateRouteStations < ActiveRecord::Migration
  def change
    create_table :route_stations do |t|
      t.integer :route_id
      t.integer :station_id
      t.timestamps null: false
    end
  end
end
