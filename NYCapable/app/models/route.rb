class Route < ActiveRecord::Base
    has_many :route_stations
  has_many :stations, through: :route_stations

end
