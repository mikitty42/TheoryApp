require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
    before do
      @user = FactoryBot.create(:user)
      #@admin_user = FactoryBot.create(:admin_user)
    end
    before do
      @product1 = FactoryBot.create(:product, name: 'test',user: @user)
    end
  describe '検索機能' do
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        #expect(Task.get_by_title('task1').count).to eq 1
        expect(Product.get_by_name('test')).to include(@product1)
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        @product1 = Product.new(name: '',price: '10000',picture: 'spec/fixtures/test.jpg',user: @user)
        expect(@product1).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        @product2 = Product.new(name: 'test_title2',price: '',picture: 'spec/fixtures/test.jpg',user: @user)
        expect(@product2).not_to be_valid
      end
    end
     context 'タスクのタイトルと詳細に内容が記載されている場合' do
       it 'バリデーションが通る' do
         @product3 = Product.new(name: 'test_title3',price: '10000',picture: '',user: @user)
         expect(@product3).not_to be_valid
       end
     end
  end
end
