require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  describe "review/destroy" do
    let!(:user)   { create :user }
    let!(:menu)   { create :menu }
    let!(:review) { create :review }
    let!(:admin)  { create :admin }

    context "user" do
      before do
        log_in_as user
        visit menu_reviews_path(menu.id)
      end

      it "create review" do
        click_on "口コミを投稿する"
        expect(current_path).to eq menu_path(menu.id)
      end
    end

    context "admin" do
      before do
        log_in_as admin
        visit menu_reviews_path(menu.id)
      end

      it "not destroy btn" do
        expect(page).not_to have_content "口コミを削除する"
      end
    end
  end
end