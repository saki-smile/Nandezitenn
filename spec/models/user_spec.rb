require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe '投稿のテスト' do
    let!(:user) { build(:user) }

    context '実際に保存してみる' do
      it "有効な場合は保存される" do
        expect(user).to be_valid
      end
    end

    context 'バリデーションチェック' do
      it "nameが空白の場合にエラーメッセージが返ってきているか" do
        user.name = ''
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:questions).macro).to eq :has_many
      end
    end

    context 'commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
