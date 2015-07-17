class RoutesController < ApplicationController

  def index
    @route = Route.all.order("route_id ASC")
    Route.update_status
  end

  def show
    @route = Route.find(params[:id])
  end

end
