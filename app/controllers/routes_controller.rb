class RoutesController < ApplicationController

  def index
    @user_location = params["variable"].split(",").map! {|num| num.to_f }
    @user_location_object = Geokit::LatLng.new(@user_location[0],@user_location[1])
    # @user_location = [@user_lat, @user_long]

    # @stations = Station.all
    # @mapped_stations = []
    # @stations.map do |station|
    #   @station_location = Geokit::LatLng.new(station.latitude,station.longitude)
    #   @distance_to = @user_location_object.distance_to(@station_location)
    #   @mapped_stations << Hash["station",station, "distance", @distance_to]
    # end
    # @final = @mapped_stations.sort_by { |x| x["distance"] }
    # return @final.slice(0,5)
    @closest_stations = Route.getDistances(@user_location_object)
    # @route = Route.all.order("route_id ASC")
    # Route.update_status
  end

  def show
    @route = Route.find(params[:id])
  end

end
