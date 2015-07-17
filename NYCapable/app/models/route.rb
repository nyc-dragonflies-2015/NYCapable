class Route < ActiveRecord::Base
  require 'open-uri'

  def initialize
    @routes = Route.all
    @doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))
    @current_status = {}

    (0..9).each do |i|
      @current_status[@doc.xpath("//name")[i].children.text()] = {
      "status" => @doc.xpath('//status')[i].children.text(),
      "notes" => note_cleaner(@doc.xpath('//text')[i].children.text())
        }
    end
  end

  def update_status
    @current_status.each do |route|
      if route[0].keys[0] == "123"
        status_data(Route.where(route_short_name: "1"))
        status_data(Route.where(route_short_name: "2"))
        status_data(Route.where(route_short_name: "3"))

      elsif route[0].keys[0] == "456"
        status_data(Route.where(route_short_name: "4"))
        status_data(Route.where(route_short_name: "5"))
        status_data(Route.where(route_short_name: "5X"))
        status_data(Route.where(route_short_name: "6"))
        status_data(Route.where(route_short_name: "6X"))


      elsif route[0].keys[0] == "7"
        status_data(Route.where(route_short_name: "7"))
        status_data(Route.where(route_short_name: "7X"))

      elsif route[0].keys[0] == "ACE"
        status_data(Route.where(route_short_name: "A"))
        status_data(Route.where(route_short_name: "C"))
        status_data(Route.where(route_short_name: "E"))

      elsif route[0].keys[0] == "BDFM"
        status_data(Route.where(route_short_name: "B"))
        status_data(Route.where(route_short_name: "D"))
        status_data(Route.where(route_short_name: "F"))
        status_data(Route.where(route_short_name: "M"))

      elsif route[0].keys[0] == "G"
        status_data(Route.where(route_short_name: "G"))

      elsif route[0].keys[0] == "JZ"
        status_data(Route.where(route_short_name: "J"))
        status_data(Route.where(route_short_name: "Z"))

      elsif route[0].keys[0] == "L"
        status_data(Route.where(route_short_name: "L"))

      elsif route[0].keys[0] == "NQR"
        status_data(Route.where(route_short_name: "N"))
        status_data(Route.where(route_short_name: "Q"))
        status_data(Route.where(route_short_name: "R"))

      elsif route[0].keys[0] == "S"
        status_data(Route.where(route_short_name: "S"))
      else
        puts "Error"
      end
    end
  end

  private

    def note_cleaner(path)
      path.gsub(/<\/?[^>]+>/, '').gsub("\n", '').gsub("&nbsp;", '').gsub("&#149;", '')
    end

    def status_data(ar_call)
      ar_call.first.update_attributes(:service_status, route[0].values[0].values[0], :service_status_note, route[0].values[0].values[1])
    end

end
