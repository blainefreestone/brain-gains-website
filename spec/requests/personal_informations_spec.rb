require 'rails_helper'

RSpec.describe "PersonalInformations", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/personal_informations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/personal_informations/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/personal_informations/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/personal_informations/update"
      expect(response).to have_http_status(:success)
    end
  end

end
