class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :route_id, null: false
      t.string :agency_id, null: false
      t.string :route_short_name, default: ""
      t.string :route_long_name, default: ""
      t.string :route_desc, default: ""
      t.string :route_type, default: ""
      t.string :route_url
      t.string :route_color
      t.string :route_text_color
      t.string :service_status, default: ''

      t.timestamps null: false
    end
  end
end
