require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /new" do
    let!(:user) { create :user }
    let!(:admin) { create :admin }
    let!(:menu) { create :menu }

    context "admin" do
      before do
        sign_in_as admin
        get new_menu_path
      end

      it "responce success" do
        expect(response).to have_http_status(:success)
      end

      it "correct menu content" do
        expect(response.body).to include "メニュー名"
        expect(response.body).to include "説明"
        expect(response.body).to include "値段"
        expect(response.body).to include "メニューを追加する"
        expect(response.body).to include "メニュー一覧はこちら"
      end
    end

    context "not admin-user" do
      before do
        sign_in_as user
        get new_menu_path
      end

      it "response not success" do
        expect(response).not_to have_http_status(:success)
      end
    end
  end

  describe "GET /index" do
    let!(:user) { create :user }
    let!(:admin) { create :admin }
    let!(:menu) { create :menu }
    
    context "user" do
      before do
        sign_in_as user
        get menus_path
      end

      it "index page response" do
        expect(response).to have_http_status(:success)
      end

      it "menus contents response body" do
        expect(response.body).to include "メニュー一覧"
        expect(response.body).to include menu.name
        expect(response.body).to include menu.description
        expect(response.body).to include menu.price.to_s
        expect(response.body).to include "予約する"
        expect(response.body).to include "口コミを見る"
        expect(response.body).to include "口コミを書く"
      end
    end

    context "admin-user" do
      before do
        sign_in_as admin
        get menus_path
      end

      it "admin response success" do
        expect(response).to have_http_status(:success)
      end

      it "admin-user only link" do
        expect(response.body).to include "メニューを削除する"
        expect(response.body).to include "メニューを追加する"
      end
    end
  end
end
