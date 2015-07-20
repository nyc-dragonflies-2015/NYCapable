class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      # No constraints?  At all?  Seems like you should put those here.
      #
      # While you're doing all the cleaning and checking on the import
      # routines, I think that you still ought express how things "in an ideal
      # universe might be."  This will, effectively, serve as a test on your
      # import code (which you're firing via the seeds.rb file)
      t.boolean :accessible
      t.float :latitude
      t.float :longitude
      t.boolean :ramp
      t.boolean :elevator
      t.string :notes
      t.boolean :transferable
      t.string :transferable_to
      t.float :distance_to

      t.timestamps null: false
    end
  end
end
