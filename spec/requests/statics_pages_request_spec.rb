require 'rails_helper'

RSpec.describe "StaticsPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/statics_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/statics_pages/top"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /instructor" do
    it "returns http success" do
      get "/statics_pages/instructor"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /plan" do
    it "returns http success" do
      get "/statics_pages/plan"
      expect(response).to have_http_status(:success)
    end
  end

end
