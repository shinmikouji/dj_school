require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create :user }

  describe "/signup" do
    before do
      visit signup_path
    end

    it "new registration test" do
      fill_in "フルネーム", with: "foober"
      fill_in "メールアドレス", with: "foobar@gmail.com"
      fill_in "パスワード(6文字以上)", with: "foobar"
      fill_in "パスワード(確認用)", with: "foobar"
      click_button "アカウントを作成する"
      expect(current_path).to eq top_path
    end

  it "errors_full_messages test" do
    fill_in "フルネーム", with: ""
    fill_in "メールアドレス", with: ""
    fill_in "パスワード(6文字以上)", with: ""
    fill_in "パスワード(確認用)", with: ""
    click_on "作成する"
    expect(page).to have_content "フルネームを入力してください"
    expect(page).to have_content "メールアドレスを入力してください"
    expect(page).to have_content "メールアドレスは不正な値です"
    expect(page).to have_content "パスワードを入力してください"
    fill_in "フルネーム", with: "testuser"
    fill_in "メールアドレス", with: "testuser@gmail.com"
    fill_in "パスワード(6文字以上)", with: "testuser"
    fill_in "パスワード(確認用)", with: "hogehoge"
    click_on "作成する"
    expect(page).to have_content "パスワード(確認用)とパスワードの入力が一致しません"
  end
end

  describe "users/:id/edit" do
    let!(:user) { create :user }

    before do
      log_in_as user
      visit edit_user_path(user.id)
    end

    it "user edit" do
      expect(current_path).to eq "/users/#{user.id}/edit"
      fill_in "フルネーム", with: "edit_user"
      fill_in "メールアドレス", with: "edituser@gmail.com"
      fill_in "パスワード(6文字以上)", with: "password"
      fill_in "パスワード(確認用)", with: "password"
      click_on "編集する"
      expect(current_path).to eq "/users/#{user.id}"
      expect(page).to have_content "プロフィールが更新されました"
    end
  end

  describe "destroy" do
    let!(:admin) { create :admin }
    let!(:user) { create :user }

    it "user destroy test" do
      log_in_as admin
      visit users_path
      first(".delete").click
      expect(page).to have_content "ユーザーが削除されました"
    end
  end
end