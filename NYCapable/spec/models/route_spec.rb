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

      context "parsing" do
        it "should return array of items" do
          Route.txt_read
          Route.doc_parse(@doc)
        end
      end

    end

    # describe "status_update method" do

    #   it "write to AR database with updated status" do

    #   end

    # end
  end
end
