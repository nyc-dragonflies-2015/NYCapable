require 'rails_helper'

describe Route do

  describe "Methods" do

    # it 'should respond to route_stations' do
    #   expect(FactoryGirl.create(:route)).to respond_to :route_stations
    # end

    describe "note_cleaner" do
      it "returns a clean string" do
        string = "<a></a>                              <br><br>                hi/\n/&nbsp;&#149;                    Planned Work                                                                                        Planned Work                                      "
        expect(Route.note_cleaner(string)).to eq("hi//")
      end

      it "fail case" do
        string = "<a></a>                              <br><br>                hi/\n/&nbsp;&#149;                    Planned Work                                                                                        Planned Work                                      "
        expect(Route.note_cleaner(string)).not_to eq("hi/dfjfj/")
      end
    end

    describe ".doc_parse" do

      it "@doc should return a file" do
        expect(@doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt')).class).to eq(Nokogiri::XML::Document)
        expect(@doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))).to_not eq(nil)
      end

    end

    describe "status_update method" do

      it "write to AR database with updated status" do
        # @current_status = [[{"123"=>{"status"=>"GOOD SERVICE", "notes"=>""}}]]

      end

    end

  end
end
