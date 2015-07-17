require 'rails_helper'

describe Route do

  describe "Methods" do

    describe "note_cleaner method" do
      it "returns a clean string" do
        string = "<a></a><br><br>hi/\n/&nbsp;&#149;"
        expect(Route.note_cleaner(string)).to eq("hi//")
      end
    end
  end
end
