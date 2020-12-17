require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  def user_login
    visit new_session_path
    fill_in 'session[email]', with: 'sample@example.com'
    fill_in 'session[password]', with: '000000'
    click_button 'Log in'
  end

  def admin_user_login
    visit new_session_path
    fill_in 'session[email]', with: 'admin@example.jp'
    fill_in 'session[password]', with: '111111'
    click_button 'Log in'
  end

  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない状態' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_on 'Sign up'

        expect(page).to have_content 'sample'
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit root_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      user_login
    end

    context 'ログインしていない状態でユーザーのデータがある場合' do
      it 'ログインができること' do
        user_login
        expect(page).to have_content 'sample'
      end
    end

    context '一般ユーザでログインしている状態' do
      it '自分の詳細画面（マイページ）に飛べること' do
        click_link 'Account'
        click_link 'Profile'
        expect(page).to have_content 'sample'
      end

      it 'ログアウトができること' do
        click_link 'Account'
        click_link 'Log out'
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe '管理画面のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end

    context '管理者でログインしている状態' do
      before do
        admin_user_login
      end
      it '管理者はユーザの削除をできること' do
        sleep 1
        visit users_path
        click_link '削除'

        expect(page.driver.browser.switch_to.alert.text).to eq "ユーザーを削除してよろしいですか？"
        page.driver.browser.switch_to.alert.dismiss
      end
    end
  end
end
