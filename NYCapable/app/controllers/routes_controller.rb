class RoutesController < ApplicationController
  # Too complex!
  #
  def index
    # What if....
    #
    # @user_location = UserLocation.new(params["variable"])
    # @user_location.to_geokit_latlong
    #
    #

    @user_location = params["variable"].split(",").map! {|num| num.to_f }
    @user_location_object = Geokit::LatLng.new(@user_location[0],@user_location[1])

    stations = Station.all
    stations.each do |station|
      # What if a station knew how to lat_longify itself?
      # and knew how to respond to station.distance(@user_location_object)
      @station_location = Geokit::LatLng.new(station.latitude,station.longitude)
      station.distance_to = @user_location_object.distance_to(@station_location)
    end

    @closest_stations = Station.order(distance_to: :asc).limit(5)
    # Again, the bad naming thing
    @route = Route.all.order("route_id ASC")
    Route.update_status
  end

  def proposed_index
    # 1.  Bury this crazy-ass data structure inside a class
    @user_location = UserLocation.new(params["variable"])
    # 2.  You have some real cleverness around the distance column, I would
    # bury that inside of a class so that prying users just accept that this
    # thing exists
    @current_stations = Station.sorted_by_distance_from(@user_location).limit(5)
    @route = Route.all.order("route_id ASC")
    Route.update_status
  end
end
