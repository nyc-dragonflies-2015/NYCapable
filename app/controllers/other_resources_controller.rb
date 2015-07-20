class OtherResourcesController < ApplicationController

  def index
    @route = Route.all.order("route_id ASC")
  end

end
