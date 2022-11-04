require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:customer) { FactoryBot.create(:customer) }
    let!(:post_content) { build(:post_content, customer_id: customer.id) }

    # test_postを作成し、空欄での登録ができるか確認します。
    subject { post_content.valid? }
    
    context 'main_imagesが存在する場合' do
      it '保存できること' do
        is_expected.to eq true;
      end
    end

    context 'main_imagesが存在しない場合' do
      it '保存できないこと' do
        post_content.main_images = nil
        is_expected.to eq false;
      end
    end
  end
end