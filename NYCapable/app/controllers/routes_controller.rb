class RoutesController < ApplicationController

  def index
    @route = Route.all.order("route_id ASC")
  end

  def show
    @route = Route.find(params[:id])
  end

end
