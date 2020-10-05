require 'rails_helper'

RSpec.describe "Comunas", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/comunas/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/comunas/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/comunas/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/comunas/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
