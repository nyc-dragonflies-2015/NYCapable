class Station < ActiveRecord::Base
    has_many :route_stations
    has_many :routes, through: :route_stations
end
