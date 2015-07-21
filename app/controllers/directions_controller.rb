class DirectionsController < ApplicationController

  def index
    # @user_location = params["variable"].split(",").map! {|num| num.to_f }
    # @user_location_object = Geokit::LatLng.new(@user_location[0],@user_location[1])
    # @destination = params["variable"].split(",").map! {|num| num.to_f }
    # @destination_location = Geokit::LatLng.new(@destination_location[0],@destination_location[1])


    @user_location_object = Geokit::LatLng.new(40.733221,@user_location[1])


    @user_closest_stations = Route.getDistances(@user_location)
    @destination_closest_stations = Route.getDistances(@destination_location)
    @closest_stations = getRoutes(@)
  end

end


# Should take in the two arrays of closest stations
# Does a comparison of each station and asks if any of the other stations are also on the same user_location_object
# if stations are on the same line, pushes into new array both hash objects, plus the cumulative distance, if not pushes into other array based on starting or destination based
# sorts the hash based on cumulative distance and returns that array [no transfer options, other options from start location, other options from end location]
# need function that will check to see if station is covered in no transfer options and if so, does not display in other stations section
