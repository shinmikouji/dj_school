require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe "login_page" do
    let!(:user) { create :user }
    let!(:other) { create :other }

    before do
      visit login_path
    end

    it "flash_messages test" do
      expect(current_path).to eq login_path
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      click_on "ログインする"
      expect(page).to have_content "ログインに失敗しました"
      visit root_path
      expect(page).not_to have_content "ログインに失敗しました"
    end

    it "login and logout success" do
      log_in_as user
      expect(current_path).to eq top_path
      expect(page).to have_content "ログアウト"
      click_on "ログアウト"
      expect(current_path).to eq root_path
      expect(page).to have_content "ログアウトしました"
      delete logout_path
    end
    
    it "signup test" do
      click_on "新規登録はこちら"
      expect(current_path).to eq signup_path
    end

    it "checkbox test" do
      check "ログインを保存する"
      log_in_as user
      delete logout_path
      expect(cookies[:remember_token]).to be_nil
    end

    it "footer test" do
      log_in_as user
      expect(page).to have_content "ホーム"
      expect(page).to have_content "予約一覧"
      expect(page).to have_content "ユーザー一覧"
      expect(page).to have_content "ログアウト"
    end

    it "cannot visit user_edit_path without logged in" do
      visit edit_user_path(user.id)
      expect(page).to have_content "ログインしてください"
      log_in_as user
      expect(current_path).to eq edit_user_path(user.id)
    end

    it "other users' pages cannot be edited" do
      log_in_as user
      visit edit_user_path(other.id)
      expect(current_path).to eq root_path
    end
  end
end