require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "GET/new" do
    let!(:user) { create :user }
    let!(:menu) { create :menu }
    let!(:menu_second) { create :menu_second }

    before do
      sign_in_as user
      get new_reservation_path
    end

    it "new_reservation response success" do
      expect(response).to have_http_status(:success)
    end

    it "correct new_reservation body" do
      expect(response.body).to include "予約フォーム"
      expect(response.body).to include "メニューを確認する"
      expect(response.body).to include "予約表を確認する"
    end
  end

  describe "GET /index" do
    let!(:user)  { create :user }
    let!(:admin) { create :admin }
    let!(:menu) { create :menu }
    let!(:menu_second) { create :menu_second }
    let!(:reservation) { create :reservation }

    context "user" do
      before do 
        sign_in_as user
        get reservations_path
      end

      it "reservation response success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
