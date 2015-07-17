class ServiceStatusController < ApplicationController

  def note_cleaner(path)
    path.gsub(/<\/?[^>]+>/, '').gsub("\n", '').gsub("&nbsp;", '').gsub("&#149;", '')
  end

  def service_status
    @doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))

    @current_status = {}

    (0..9).each do |i|
      @current_status[@doc.xpath("//name")[i].children.text()] = {
      "status" => @doc.xpath('//status')[i].children.text(),
      "notes" => note_cleaner(@doc.xpath('//text')[i].children.text())
      }
    end
    @current_status
  end


end