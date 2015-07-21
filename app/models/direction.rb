class Direction < ActiveRecord::Base

  def self.getDirections(starting_location, ending_location, user_location, destination_location)
    no_transfers = []
    keep_track = []
    starting_other = []
    destination_other= []
    starting_location.each do |start_station|
      start_station_routes = start_station["station"].routes.pluck(:route_short_name)
        ending_location.each do |end_station|
          end_station_routes = end_station["station"].routes.pluck(:route_short_name)
          if (start_station_routes & end_station_routes).empty? == true
              if keep_track.include?(start_station) != true
                keep_track.push(start_station)
                starting_other.push(start_station)
              end
              if keep_track.include?(end_station) != true
                keep_track.push(end_station)
                destination_other.push(end_station)
              end
          else
            distance = (Geokit::LatLng.new(start_station["station"]["latitude"],start_station["station"]["longitude"]).distance_to(user_location)) + (Geokit::LatLng.new(end_station["station"]["latitude"],end_station["station"]["longitude"]).distance_to(destination_location))
            no_transfers << Hash["start", start_station, "destination", end_station, "distance", distance]
            keep_track.push(start_station)
            keep_track.push(end_station)
          end
          if (destination_other != [] && no_transfers != [] && destination_other[-1] == no_transfers[-1]["destination"])
            destination_other.pop
          end
        end
        if (starting_other != [] && no_transfers != [] && starting_other[-1] == no_transfers[-1]["start"])
          starting_other.pop
        end
    end
    sorted = no_transfers.sort_by { |x| x["distance"] }
    final = sorted.slice(0,5)
    return [final,starting_other,destination_other]
  end

  def self.getHTML(routes)
    html = []
    routes.each do |path|
      html << "<div class='panel-group' id='accordion'>
        # <div class='panel panel-default'>
        <div class='panel-heading'>
          <h4 class='panel-title'>
            <a data-toggle='collapse' data-parent='#accordion' href='#collapseFive'>
              <h3 class='stationName'>#{Station.print_icons(path['start']['station'])} || #{path['start']['station']['name']}</h3>
              </a>
            </h4>
        </div>

        <div id='collapseFive' class='panel-collapse collapse in'>
          <div class='panel-body'>
            <div class='station' id='station#{routes.index(path)}Map'></div>
            <div id='station#{routes.index(path)}DirectionsPanel'></div>
            <div id='station#{routes.index(path)}Elevation'></div>
          </div>
        </div>
        </div>

        <div class='header-title'><h4>To:<h4></div>

        <div class='panel panel-default'>
        <div class='panel-heading'>
          <h4 class='panel-title'>
            <a data-toggle='collapse' data-parent='#accordion' href='#collapseFive'>
              <h3 class='stationName'> #{Station.print_icons(path['destination']['station'])} || #{path['destination']['station']['name']} </h3>
              </a>
            </h4>
        </div>

        <div id='collapseFive' class='panel-collapse collapse in'>
          <div class='panel-body'>
            <div class='station' id='station#{routes.index(path)}Map'></div>
            <div id='station#{routes.index(path)}DirectionsPanel'></div>
            <div id='station#{routes.index(path)}Elevation'></div>
          </div>
        </div>
        </div>"

    end
    return html.join.html_safe
  end

end

# <div class='panel panel-default'>
#   <div class='panel-heading'>
#     <h4 class='panel-title'>
#       <a data-toggle='collapse' data-parent='#accordion' href='#collapseFive'>
#         <h3 class='stationName'>#{Station.print_icons(path['start']['station'])} || #{path['start']['station']['name']}</h3>
#         </a>
#       </h4>
#   </div>

#   <div id='collapseFive' class='panel-collapse collapse in'>
#     <div class='panel-body'>
#       <div class='station' id='station#{routes.index(path)}Map'></div>
#       <div id='station#{routes.index(path)}DirectionsPanel'></div>
#       <div id='station#{routes.index(path)}Elevation'></div>
#     </div>
#   </div>
#   </div>
#   <p> TO: </p>
#   <div class='panel panel-default'>
#   <div class='panel-heading'>
#     <h4 class='panel-title'>
#       <a data-toggle='collapse' data-parent='#accordion' href='#collapseFive'>
#         <h3 class='stationName'> #{Station.print_icons(path['destination']['station'])} || #{path['destination']['station']['name']} </h3>
#         </a>
#       </h4>
#   </div>

#   <div id='collapseFive' class='panel-collapse collapse in'>
#     <div class='panel-body'>
#       <div class='station' id='station#{routes.index(path)}Map'></div>
#       <div id='station#{routes.index(path)}DirectionsPanel'></div>
#       <div id='station#{routes.index(path)}Elevation'></div>
#     </div>
#   </div>
