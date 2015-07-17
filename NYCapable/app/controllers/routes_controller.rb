class RoutesController < ApplicationController

  def index
    @route = Route.all
  end

end
