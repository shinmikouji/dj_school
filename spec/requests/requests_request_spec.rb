require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "GET /new" do
    let!(:user) { create :user }

    before do
      sign_in_as user
      get new_request_path
    end

    it "new_request_path response" do
      expect(response).to have_http_status(:success)
    end

    it "correct new_request_page body" do
      expect(response.body).to include "要望"
      expect(response.body).to include "投稿する"
      expect(response.body).to include "(例) 機材の貸し出しをして欲しいです"
      expect(response.body).to include "要望一覧はこちら"
    end
  end

  describe "GET /index" do
    let!(:other) { create :other }
    let!(:request) { create :request }

    before do
      sign_in_as other
      get requests_path
    end

    it "link is success" do
      expect(response).to have_http_status(:success)
    end

    it "request content test" do
      expect(response.body).to include request.user.name
      expect(response.body).to include request.content
    end
  end
end
