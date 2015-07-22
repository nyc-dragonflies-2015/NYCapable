class RoutesController < ApplicationController

  def index
    @user_location = params["variable"].split(",").map! {|num| num.to_f }
    @user_location_object = Geokit::LatLng.new(@user_location[0],@user_location[1])
    @closest_stations = Route.getDistances(@user_location_object)
  end

  def show
    @route = Route.find(params[:id])
  end

end
