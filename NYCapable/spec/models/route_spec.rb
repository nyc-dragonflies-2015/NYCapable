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

    describe ".txt_read" do
        it "should return a file" do
          expect((Route.txt_read).class).to eq(Nokogiri::XML::Document)
          expect((Route.txt_read).class).to_not eq(nil)
        end


    end

    describe ".doc_parse" do
        it "should return parsed data" do
          expect(Route.doc_parse(Route.txt_read).count).to eq(10)
          expect(Route.doc_parse(Route.txt_read).count).to_not eq(3)
        end
    end

    # describe ".update_status" do
        # it "write to AR database with updated status" do
        #   Route.create(id: 9, route_id: "7", agency_id: "MTA NYCT", route_short_name: "7", route_long_name: "Flushing Local", route_desc: "Trains operate between Main St-Flushing, Queens, a...", route_type: "1", route_url: "http://web.mta.info/nyct/service/pdf/t7cur.pdf", route_color: "B933AD", route_text_color: nil, service_status: "GOOD SERVICE", created_at: "2015-07-17 15:20:11", updated_at: "2015-07-17 19:54:45", service_status_note: "")
        #   @current_status = [[{"7"=>{"status"=>"GOOD SERVICE", "notes"=>""}}]]
    # end
  end
end
