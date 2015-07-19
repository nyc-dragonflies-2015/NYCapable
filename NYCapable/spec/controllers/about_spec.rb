require 'rails_helper'

describe AboutController do

  describe "GET index" do
    it 'should get the index' do
      get :index
      (expect(response.status).to eq(200))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template("index")
    end
  end


end