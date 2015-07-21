class Station < ActiveRecord::Base
    has_many :route_stations
    has_many :routes, through: :route_stations

  def self.print_icons(station)
    return "" if station.nil?
    @routes = station.routes.pluck(:route_short_name).partition{|x| x.is_a? String}.map(&:sort).flatten
    html = []
    @total_routes = ["1","2","3","4","5","6","7","A","C","E","B","D","F","M","G","J","Z","L","S","N","Q","R"]
    @not_used = @total_routes-@routes
    @final = @total_routes - @not_used
    # byebug
    @final.each do |x|
      html << "<span class='mta-bullet mta-#{x.downcase}'>#{x}</span>  "
    end
    return html.join.html_safe
  end

end
