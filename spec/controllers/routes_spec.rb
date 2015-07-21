require 'rails_helper'

describe RoutesController do

 describe "GET index" do
    it 'should get the index' do
      get :index , :variable=>'40.7063634,-74.00909630000001'
      (expect(response.status).to eq(200))
    end

    it "assigns a user location" do
      get :index , :variable=>'40.7063634,-74.00909630000001'
      expect(:user_location).not_to be_nil
    end

    it "assigns a user location object" do
      get :index , :variable=>'40.7063634,-74.00909630000001'
      expect(:user_location_object).not_to be_nil
    end

    it "creates closest stations" do
      get :index , :variable=>'40.7063634,-74.00909630000001'
      expect(:closest_stations).not_to be_nil
    end
  end
end
