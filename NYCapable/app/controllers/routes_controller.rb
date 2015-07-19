class RoutesController < ApplicationController

  def index
    @user_lat = 40.760750
    @user_long = -73.990438
    @user_location = Geokit::LatLng.new(@user_lat,@user_long)
    @bens_location = [@user_lat, @user_long]

    @stations = Station.all
    @stations.each do |station|
      @station_location = Geokit::LatLng.new(station.latitude,station.longitude)
      station.distance_to = @user_location.distance_to(@station_location)
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
