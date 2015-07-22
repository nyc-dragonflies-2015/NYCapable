class DirectionsController < ApplicationController

  def index
    @user_location = params["variable"].split(",").map! {|num| num.to_f }
    @starting_location = [@user_location[0],@user_location[1]]
    @destination_location = [@user_location[2],@user_location[3]]

    @user_location_object = Geokit::LatLng.new(40.760785,-73.990422)
    @destination_location_object = Geokit::LatLng.new(40.706308, -74.009253)


    @user_closest_stations = Route.getDistances(@user_location_object)
    @destination_closest_stations = Route.getDistances(@destination_location_object)
    @closest_stations = Direction.getDirections(@user_closest_stations,@destination_closest_stations, @user_location_object, @destination_location_object)
    @station_locations = []
    @closest_stations[0].each do |pair|
        starting_station = [pair["start"]["station"]["latitude"],pair["start"]["station"]["longitude"]]
        ending_station = [pair["destination"]["station"]["latitude"],pair["destination"]["station"]["longitude"]]
        @station_locations.push([[@starting_location,starting_station],[ending_station,@destination_location]])
    end
  end

end


# Should take in the two arrays of closest stations
# Does a comparison of each station and asks if any of the other stations are also on the same user_location_object
# if stations are on the same line, pushes into new array both hash objects, plus the cumulative distance, if not pushes into other array based on starting or destination based
# sorts the hash based on cumulative distance and returns that array [no transfer options, other options from start location, other options from end location]
# need function that will check to see if station is covered in no transfer options and if so, does not display in other stations section
