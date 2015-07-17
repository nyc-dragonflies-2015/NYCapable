require 'rails_helper'

describe RoutesController do

 describe "GET index" do
    it "pulls MTA routes from the database" do
      get :index
      expect(assigns(:route)).to be_a ActiveRecord::Relation
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  # describe "GET show" do

  #   end
  # end

  end
end