class Route < ActiveRecord::Base
  has_many :route_stations
  has_many :stations, through: :route_stations

  require 'open-uri'

  def self.txt_read
    @doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))
  end

  def self.doc_parse(file)
    @current_status = []
    (0..9).each do |i|
      @current_status << [file.xpath("//name")[i].children.text() => {
      "status" => file.xpath('//status')[i].children.text(),
      "notes" => note_cleaner(file.xpath('//text')[i].children.text())
        }]
    end
  end

  def self.note_cleaner(path)
    path.gsub(/<\/?[^>]+>/, '').gsub("\n", '').gsub("&nbsp;", '').gsub("&#149;", '')
    .gsub("                    Planned Work                                      ", '')
    .gsub("                                                  Planned Work                                      ", ' ')
    .gsub("                              ", '')
    .gsub("                ", '')
  end


  def self.update_status
    Route.txt_read
    Route.doc_parse(@doc)

    @current_status.each do |route|
      if route[0].keys[0] == "123"
        Route.where(route_short_name: "1").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "2").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "3").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "456"
        Route.where(route_short_name: "4").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "5").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "5X").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "6").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "6X").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})


      elsif route[0].keys[0] == "7"
        Route.where(route_short_name: "7").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "7X").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "ACE"
        Route.where(route_short_name: "A").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "C").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "E").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "BDFM"
        Route.where(route_short_name: "B").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "D").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "F").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "M").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "G"
        Route.where(route_short_name: "G").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "JZ"
        Route.where(route_short_name: "J").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "Z").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "L"
        Route.where(route_short_name: "L").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "NQR"
        Route.where(route_short_name: "N").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "Q").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
        Route.where(route_short_name: "R").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})

      elsif route[0].keys[0] == "S"
        Route.where(route_short_name: "S").first.update_attributes({:service_status => route[0].values[0].values[0], :service_status_note => route[0].values[0].values[1]})
      else
        puts "Error"
      end
    end
  end
end

