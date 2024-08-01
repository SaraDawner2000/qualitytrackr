require 'rails_helper'

RSpec.describe "LandingPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/landing_page/home"
      expect(response).to have_http_status(:success)
    end
  end

end
