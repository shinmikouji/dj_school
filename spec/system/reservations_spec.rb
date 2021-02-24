require 'rails_helper'

RSpec.describe "Reservations", type: :system do
  describe "reservation/new" do
    context "user" do
      let!(:user) { create :user }
      let!(:reservation) { create :reservation }
      let!(:menu) { create :menu }
      let!(:menu_second) { create :menu_second }
      let!(:menu_third) { create :menu_third }

      before do
        log_in_as user
        visit new_reservation_path
      end

      it "name is nil" do
        fill_in "フルネーム(必ずご自身のお名前)", with: nil
        click_on "登録する"
        expect(page).to have_content "Nameを入力してください"
      end

      it "name is blank" do
        fill_in "フルネーム(必ずご自身のお名前)", with: ""
        click_on "登録する"
        expect(page).to have_content "Nameを入力してください"
      end

      it "time & menu is incorrect" do
        fill_in "フルネーム(必ずご自身のお名前)", with: user.name
        select "選択してください", from: "menu_id"
        select_date("2023,12,20", from: "日時")
        select_time("09", "00", from: "日時")
        click_on "登録する"
        expect(page).to have_content "Start time(営業時間)は9:30から18:30になります"
        expect(page).to have_content "Menuを入力してください"
      end

      it "menu link test" do
        click_on "メニューを確認する"
        expect(current_path).to eq menus_path
      end

      it "reservations path link test" do
        click_on "予約表を確認する"
        expect(current_path).to eq reservations_path
      end
    end

    context "admin" do
      let!(:admin) { create :admin }
      let!(:reservation) { create :reservation }
      let!(:menu) { create :menu }
      let!(:menu_second) { create :menu_second }
      let!(:menu_third) { create :menu_third }

      before do
        log_in_as admin
        visit reservations_path
      end

      it "admin only link test" do
        expect(page).to have_content reservation.name
        expect(page).to have_content reservation.start_time.to_s
        click_on "削除"
        expect(page).to have_content "予約を削除しました"
        click_on "予約したい方はこちら"
        expect(current_path).to eq new_reservation_path
      end
    end
  end
end