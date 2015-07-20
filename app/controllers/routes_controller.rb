class RoutesController < ApplicationController

  def index
    @user_location = params["variable"].split(",").map! {|num| num.to_f }
    @user_location_object = Geokit::LatLng.new(@user_location[0],@user_location[1])
    # @user_location = [@user_lat, @user_long]

    @stations = Station.all
    @stations.each do |station|
      @station_location = Geokit::LatLng.new(station.latitude,station.longitude)
      station.distance_to = @user_location_object.distance_to(@station_location)
      station.save
    end
    @closest_stations = Station.order(distance_to: :asc).limit(5)
    @route = Route.all.order("route_id ASC")
    Route.update_status
  end

  def show
    @route = Route.find(params[:id])
  end

end
