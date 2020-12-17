require 'rails_helper'
RSpec.describe 'Product管理機能', type: :system do
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

  before do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
    FactoryBot.create(:product)

    #visit new_session_path
    #fill_in 'session[email]', with: @user.email
    #fill_in 'session[password]', with: @user.password
    #click_button 'Log in'
  end

  describe '新規作成機能' do
    context '管理者でログインしている状態' do
      #before do
        #admin_user_login
      #end
    context 'Productを新規作成した場合' do
      it '作成したタスクが表示される' do
        click_link 'Account'
        click_link 'Products Create'
        fill_in 'product[name]', with: "Test Product"
        fill_in 'product[price]', with: "10000"
        attach_file "product_picture", "app/assets/images/test.jpg"
        click_on '商品登録'
        expect(page).to have_content '商品を登録しました'
      end
    end
    it '管理者はProductの編集画面からProductを編集できること' do

      visit products_path
      click_link '編集'
      fill_in 'product[name]', with: 'product_after'
      click_button '商品登録登録'
      expect(page).to have_content '更新しました'
    end
        it '管理者はProductの削除を出来る事' do
          visit products_path
          click_link '削除'
          expect(page.driver.browser.switch_to.alert.text).to eq "商品を削除してよろしいですか？"
          page.driver.browser.switch_to.alert.dismiss
        end
      end
    end
  describe '一覧表示機能' do
    before do
      @user = FactoryBot.create(:user)
      user_login
      product = create(:product)
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのProduct一覧が表示される' do
        visit products_path
        expect(post).to be_valid
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のProduct詳細画面に遷移した場合' do
       it '該当Productの内容が表示される' do

         visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         expect(page).to have_content ''
       end
     end
  end
  describe '' do
     context '任意のProduct詳細画面に遷移した場合' do
       it 'お気に入り出来る' do

         visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         expect(page).to have_content ''
       end
     end
  end
  describe '詳細表示機能' do
     context '任意のProduct詳細画面に遷移した場合' do
       it 'カートの入れる事ができる' do

         visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         expect(page).to have_content ''
       end
     end
  end
  describe 'カート詳細機能' do
     context 'カートに入れるボタンを押すと' do
       it 'カート詳細画面に推移する' do

         visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         expect(page).to have_content ''
       end
     end
  end

     context 'カート詳細画面で削除ボタンを押すと' do
       it 'カートから削除される' do

         visit task_path(task.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         expect(page).to have_content ''
       end
     end
end
