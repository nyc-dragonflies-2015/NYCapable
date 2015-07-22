class Station < ActiveRecord::Base
    has_many :route_stations
    has_many :routes, through: :route_stations

  def self.print_icons(station)
    @routes = station.routes.pluck(:route_short_name).partition{|x| x.is_a? String}.map(&:sort).flatten
    html = []
    @routes.each do |x|
      html << "<span class='mta-bullet mta-#{x.downcase}'>#{x}</span>"
    end
    return html.join.html_safe
  end

  def self.print_joint_icons(routes)
    html = []
    routes.each do |x|
      html << "<span class='mta-bullet mta-#{x.downcase}'> #{x} </span>  "
    end
    return html.join.html_safe
  end

end
