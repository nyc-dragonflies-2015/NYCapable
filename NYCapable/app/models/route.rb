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
        @route = Route.where(route_short_name: "1").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "2").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "3").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "456"
        @route = Route.where(route_short_name: "4").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "5").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "6").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "7"
        @route = Route.where(route_short_name: "4").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "5").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "6").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "ACE"
        @route = Route.where(route_short_name: "A").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "C").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "E").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "BDFM"
        @route = Route.where(route_short_name: "B").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "D").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "F").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "M").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "G"
        @route = Route.where(route_short_name: "G").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "JZ"
        @route = Route.where(route_short_name: "J").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "Z").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "L"
        @route = Route.where(route_short_name: "L").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "NQR"
        @route = Route.where(route_short_name: "N").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "Q").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
        @route = Route.where(route_short_name: "R").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])

      elsif route[0].keys[0] == "S"
        @route = Route.where(route_short_name: "S").first.update_attributes(
          :service_status, route[0].values[0].values[0],
          :service_status_note, route[0].values[0].values[1])
      else
        puts "Error"
      end
    end
  end

  private

    def note_cleaner(path)
      path.gsub(/<\/?[^>]+>/, '').gsub("\n", '').gsub("&nbsp;", '').gsub("&#149;", '')
    end

end
