require 'rails_helper'

RSpec.describe 'Questionモデルのテスト', type: :model do
  describe '投稿のテスト' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let!(:question) { build(:question, user_id: user.id, category_id: category.id) }

    context '実際に保存してみる' do
      it "有効な投稿内容の場合は保存される" do
        expect(question).to be_valid
      end
    end

    context 'バリデーションチェック' do
      it "titleが空白の場合にエラーメッセージが返ってきているか" do
        question.title = ''
        question.valid?
        expect(question.errors[:title]).to include("を入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Categoryモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:category).macro).to eq :belongs_to
      end
    end

    context 'commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
