require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /connect" do
    it "returns http success" do
      get "/accounts/connect"
      expect(response).to have_http_status(:success)
    end
  end

end
