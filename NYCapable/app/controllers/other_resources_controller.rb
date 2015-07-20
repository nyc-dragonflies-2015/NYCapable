class OtherResourcesController < ApplicationController
  def index
    # Bad naming.  Is this a plural or a singular?  It's gotta be a plural so I
    # would expect `@routes`.  These things are helpful in finding bugs.
    @route = Route.all.order("route_id ASC")
  end
end
