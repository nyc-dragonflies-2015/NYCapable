
require 'csv'

[Route, Station, RouteStation].each{ |klass| klass.destroy_all}


#Routes seed
CSV.foreach('db/google_transit/routes.txt',
  :headers => true,
  :header_converters => :symbol) do |args|
    Route.create(
      route_id: args[:route_id],
      agency_id: args[:agency_id],
      route_short_name: args[:route_short_name],
      route_long_name: args[:route_long_name],
      route_desc: args[:route_desc],
      route_type: args[:route_type],
      route_url: args[:route_url],
      route_color: args[:route_color],
      route_text_color: args[:route_text_color]
    )
end

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

CSV.foreach('db/route_stations.txt',
  :headers => true,
  :header_converters => :symbol) do |args|
    RouteStation.create(
      route_id: args[:route_id],
      station_id: args[:station_id],
    )
end