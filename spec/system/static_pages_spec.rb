require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "StaticPages/home" do
    before do
      visit root_path
    end

    it "signup link test" do
      click_on "新規登録"
      expect(current_path).to eq signup_path
    end

    it "login link test" do
      click_on "ログイン"
      expect(current_path).to eq login_path
    end

    it "click_title test" do
      click_on "E.Y.M"
      expect(current_path).to eq root_path
    end
  end

  describe "StaticPages/top" do
    context "user" do
      let!(:user) { create :user }
      let!(:menu) { create :menu }
      let!(:menu_second) { create :menu_second }

      before do
        log_in_as user
      end

      it "my page link test" do
        click_on "My Page"
        expect(current_path).to eq "/users/#{user.id}"
      end

      it "manu page link test" do
        click_on "Plan"
        expect(current_path).to eq menus_path
      end

      it "request page link test" do
        click_on "Users Voice"
        expect(current_path).to eq new_request_path
      end

      it "staff page link test" do
        click_on "Instructor"
        expect(current_path).to eq instructor_path
      end

      it "review page link test" do
        click_on "Reservation"
        expect(current_path).to eq reservations_path
      end
    end
  end
end