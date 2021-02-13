require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    before do
      get signup_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "there is name of registation" do
      expect(responce.body).to include "新規登録"
    end

    it "is correct in registation form" do
      expect(response.body).to include "フルネーム"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード(6文字以上)"
      expect(response.body).to include "パスワード(確認用)"
      expect(response.body).to include "アカウントを作成する"
    end
  end

  describe "GET/edit" do
    before get 


end
