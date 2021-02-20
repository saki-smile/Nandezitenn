require 'rails_helper'

describe 'ログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end

      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[6].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      it '新規登録リンクの内容が正しい' do
        sign_up = find_all('img')[5].native.inner_text
        expect(page).to have_link sign_up, href: new_user_registration_path
      end
      it '記事一覧リンクの内容が正しい' do
        questions_link = find_all('img')[4].native.inner_text
        expect(page).to have_link questions_link, href: questions_path
      end
      it 'ユーザー一覧リンクの内容が正しい' do
        users_link = find_all('img')[3].native.inner_text
        expect(page).to have_link users_link, href: users_path
      end
      it 'アバウトリンクの内容が正しい' do
        about_link = find_all('img')[2].native.inner_text
        expect(page).to have_link about_link, href: about_path
      end
    end
  end
end
