# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach('db/stations.txt',
  :headers => true,
  :header_converters => :symbol) do |args|
    Station.create(
        name: args[:name],
        accessible: args[:accessible],
        latitude: args[:latitude],
        longitude: args[:longitude],
        ramp: args[:ramp],
        elevator: args[:elevator],
        notes: args[:notes],
        transferable: args[:transferable],
        transferable_to: args[:transferable_to],
        distance_to: args[:distance_to]
   )
end
