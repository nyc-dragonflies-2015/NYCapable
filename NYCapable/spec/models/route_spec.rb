require 'rails_helper'

describe Route do

  describe "Methods" do

    describe "note_cleaner method" do

      it "returns a clean string" do
        string = "<a></a>                              <br><br>                hi/\n/&nbsp;&#149;                    Planned Work                                                                                        Planned Work                                      "
        expect(Route.note_cleaner(string)).to eq("hi//")
      end

      it "fail case" do
        string = "<a></a>                              <br><br>                hi/\n/&nbsp;&#149;                    Planned Work                                                                                        Planned Work                                      "
        expect(Route.note_cleaner(string)).not_to eq("hi/dfjfj/")
      end

    end

    describe "doc_parse method" do

      it "should return status updates" do
        # allow(Route.doc_parse).to recieve
      end

    end

    describe "status_update method" do

      it "write to AR database with updated status" do
        # @current_status = [[{"123"=>{"status"=>"GOOD SERVICE", "notes"=>""}}]]

      end

    end

  end
end
