require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "menus/show" do
    let!(:user)   { create :user }
    let!(:menu)   { create :menu }
    let!(:review) { create :review }

    before do
      sign_in_as user
      get menu_path(menu.id)
    end

    it "menu show response success" do
      expect(response).to have_http_status(:success)
    end

    it "correct menu show body" do
      expect(response.body).to include "口コミ"
      expect(response.body).to include menu.name
      expect(response.body).to include "口コミを確認する"
      expect(response.body).to include "口コミを投稿する"
    end
  end

  describe "menu/review" do
    let!(:user)   { create :user }
    let!(:menu)   { create :menu }
    let!(:review) { create :review }

    before do
      sign_in_as user
      get menu_reviews_path(menu.id)
    end

    it "review index response success" do
      expect(response).to have_http_status(:success)
    end

    it "is correct review index content" do
      expect(response.body).to include menu.name
      expect(response.body).to include review.content
    end
  end
end
