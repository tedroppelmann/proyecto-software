require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "/home" do
    it "should return a succesful request" do
      get "/static_pages/home"
      expect(response).to have_http_status(:ok)
    end
    it "should render the home view" do
      get "/static_pages/home"
      expect(response).to render_template(:home)
    end
  end
end
