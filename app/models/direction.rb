class Direction < ActiveRecord::Base

  def self.getDirections(starting_location, ending_location)
    no_transfers = []
    starting_other = []
    destination_other= []
    starting_location.each do |start_station|
      start_station_routes = start_station["station"].routes.pluck(:route_short_name)
        ending_location.each do |end_station|
          end_station_routes = end_station["station"].routes.pluck(:route_short_name)
          if (start_station_routes & end_station_routes).empty? == true
            starting_other << start_station
            destination_other << end_station
          else
            no_transfers << Hash["start", start_station, "destination", end_station]
          end
        end
    end
    byebug
  end

end
