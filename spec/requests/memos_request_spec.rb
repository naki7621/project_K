require 'rails_helper'

RSpec.describe "Memos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/memos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
