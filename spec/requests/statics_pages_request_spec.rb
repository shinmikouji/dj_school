require 'rails_helper'

RSpec.describe "StaticsPages", type: :request do
  describe "Home Page" do
    before do
      get root_path
    end

    it "returns http success in Home Page" do
      expect(response).to have_http_status(:success)
    end

    it "should heve the correct content" do
      expect(response.body).to include "About"
      expect(response.body).to include "ログイン"
      expect(response.body).to include "新規登録"
    end
  end

  describe "Top Page" do
    context "normal user" do
      let!(:user) { create :user }

      before do  
        sign_in_as user
        get top_path
      end

      it "returns http success in Top Page" do
        expect(response).to have_http_status(:success)
      end
      
      it "should heve the correct content in Top Page" do
        expect(response.body).to include "Reservation"
        expect(response.body).to include "Plan"
        expect(response.body).to include "Instructor"
        expect(response.body).to include "Users Voice"
        expect(response.body).to include "My Page"
      end
    end
  end
end
