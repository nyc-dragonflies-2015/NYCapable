require 'rails_helper'

describe Route do

  describe "Methods" do
    describe "note_cleaner" do
      let(:string){"<a></a>                              <br><br>                hi/\n/&nbsp;&#149;                    Planned Work                                                                                        Planned Work                                      "}
      it "returns a clean string" do
        expect(Route.note_cleaner(string)).to eq("hi//")
      end

      it "fail case" do
        expect(Route.note_cleaner(string)).not_to eq("hi/dfjfj/")
      end
    end

    describe ".txt_read" do
      it "should return a file" do
        # Prefer .expect(actual).to be_an(Nokogiri)....
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
  end
end
