require 'rails_helper'

RSpec.describe "Leads", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/lead/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/lead/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /how_it_works" do
    it "returns http success" do
      get "/lead/how_it_works"
      expect(response).to have_http_status(:success)
    end
  end

end
