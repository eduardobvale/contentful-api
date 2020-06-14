require 'rails_helper'
require "vcr"

RSpec.describe "Recipes", type: :request do
  before(:each) do
    VCR.insert_cassette "recipes", :record => :new_episodes
  end
  
  after(:each) do
    VCR.eject_cassette
  end

  describe "GET /index" do
    it "returns http success" do
      get "/recipes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    context "for a valid :id" do
      it "returns http success" do
        get "/recipes/4dT8tcb6ukGSIg2YyuGEOm"
        expect(response).to have_http_status(:success)
      end
    end

    context "for a uknown :id" do
      it "redirects to 404" do
        get "/recipes/INVALID_ID"
        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("The recipe you were looking for doesn't exist.")
      end
    end
  end
end