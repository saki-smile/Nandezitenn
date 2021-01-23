require 'rails_helper'

RSpec.describe 'categoryモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:questions).macro).to eq :has_many
      end
    end
  end
end
