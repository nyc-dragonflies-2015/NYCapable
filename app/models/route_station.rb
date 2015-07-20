class RouteStation < ActiveRecord::Base
  belongs_to :route
  belongs_to :station
end
