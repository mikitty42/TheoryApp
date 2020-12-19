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
    @product = FactoryBot.create(:product, user: @user)
    #user_login
  end

  describe '新規作成機能' do
    context '管理者でログインしている状態' do
      before do
        admin_user_login
      end
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
      click_button '商品登録'
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
    #before do
      #user_login
      #product = FactoryBot.create(:product, user: @user)
    #end
    context '一覧画面に遷移した場合' do
      it '作成済みのProduct一覧が表示される' do
        visit products_path
        expect(@product).to be_valid
      end
    end
  end
  before do
    user_login
  end
  describe '詳細表示機能' do
     context '任意のProduct詳細画面に遷移した場合' do
       it '該当Productの内容が表示される' do
        #product = FactoryBot.create(:product,name: 'test_title2',price: '15000',picture:"app/assets/images/test.jpg",user: @user)
         visit product_path(@product.id)
         expect(page).to have_content 'test_title'
         expect(page).to have_content '10000'
         #expect(page).to have_content "#{Rails.root}/spec/fixtures/test.jpg"
         page.should have_selector( 'img[alt="logo.jpg"]' )
       end
     end
  end
  describe '' do
     context '任意のProduct詳細画面に遷移した場合' do
       it 'お気に入り出来る' do
         #product = FactoryBot.create(:product,name: 'test_title2',price: '15000',picture:"app/assets/images/test.jpg")
         visit product_path(@product.id)
         click_link 'お気に入りする'
         expect(page).to have_content 'お気に入りに追加しました'
       end
     end
  end
  describe 'カート詳細機能' do
     context 'カートに入れるボタンを押すと' do
       it 'カート詳細画面に推移する' do
         #product = FactoryBot.create(:product,name: 'test_title2',price: '15000',picture:"app/assets/images/test.jpg")
         visit product_path(@product.id)
         click_button 'カートに入れる'
         expect(page).to have_content 'test_title'
       end
     end
  end
end
