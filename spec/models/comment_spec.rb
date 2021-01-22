require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  # describe 'コメント投稿のテスト' do
  #   let(:user) { create(:user) }
  #   let(:question) { create(:question) }
  #   let!(:comment) { build(:comment, user_id: user.id, question_id: question.id) }

  #   context '実際に保存してみる' do
  #     it "有効なコメントの場合は保存される" do
  #       expect(comment).to be_valid
  #     end
  #   end

  #   # context 'バリデーションチェック' do
  #   #   it "titleが空白の場合にエラーメッセージが返ってきているか" do
  #   #     question.title = ''
  #   #     question.valid?
  #   #     expect(question.errors[:title]).to include("を入力してください")
  #   #   end
  #   # end
  # end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Questionモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end
  end
end
