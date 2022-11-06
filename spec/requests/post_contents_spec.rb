require 'rails_helper'

RSpec.describe "Posts", type: :request do
  # FactoryBotのテストデータを使ってuserとpostのデータを作成
  let!(:customer) { create(:customer) }
  let!(:post_content) { create(:post_content, customer_id: customer.id) }

  describe "GET /new" do
    it "returns http success" do
      sign_in customer
      get new_post_content_path({post_content: {latitude: 35.6684415, longitude: 139.6007842,address: post_content.address }})
      expect(response).to have_http_status(:success)
    end
  end

#   describe "GET /index" do
#     it "returns http success" do
#       get posts_path
#       expect(response).to have_http_status(:success)
#     end
#   end

  describe "GET /show" do
    it "returns http success" do
      sign_in customer
      get post_content_path(post_content.id)
      expect(response).to have_http_status(:success)
    end
  end
end