require 'rails_helper'

RSpec.describe 'inquiryモデルのテスト', type: :model do
  describe '投稿のテスト' do
    let!(:inquiry) { build(:inquiry) }

    context '実際に保存してみる' do
      it "有効な投稿内容の場合は保存される" do
        expect(inquiry).to be_valid
      end
    end

    context 'バリデーションチェック' do
      it "nameが空白の場合にエラーメッセージが返ってきているか" do
        inquiry.name = ''
        inquiry.valid?
        expect(inquiry.errors[:name]).to include("を入力してください")
      end

      it "emailが空白の場合にエラーメッセージが返ってきているか" do
        inquiry.email = ''
        inquiry.valid?
        expect(inquiry.errors[:email]).to include("を入力してください")
      end

      it "messageが空白の場合にエラーメッセージが返ってきているか" do
        inquiry.message = ''
        inquiry.valid?
        expect(inquiry.errors[:message]).to include("を入力してください")
      end
    end
  end
end
