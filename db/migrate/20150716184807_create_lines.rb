class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.string :service_status
      t.boolean :runs_weekend
      t.boolean :runs_night
      t.string :notes

      t.timestamps null: false
    end
  end
end
