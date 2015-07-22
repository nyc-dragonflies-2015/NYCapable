class HomeController < ApplicationController
  def index
    Route.update_status
  end
end