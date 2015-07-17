class RoutesController < ApplicationController

  def index
    @user_lat = 40.706299
    @user_long = -74.009146
    @user_location = Geokit::LatLng.new(@user_lat,@user_long)

    @stations = Station.all
    @stations.each do |station|
      @station_location = Geokit::LatLng.new(station.latitude,station.longitude)
      station.distance_to = @user_location.distance_to(@station_location)
      station.save
    end

    @route = Route.all.order("route_id ASC")
  end

  def show
    @route = Route.find(params[:id])
  end

end
