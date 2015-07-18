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
        end
    end

    describe ".update_status" do
        it "write to AR database with updated status" do
          @current_status = [[{"7"=>{"status"=>"GOOD SERVICE", "notes"=>""}}]]
          allow(Route).to receive(:update_status).and_return({something: 'good'})
        end
    end
  end
end
