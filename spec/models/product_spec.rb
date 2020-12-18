require 'rails_helper'
describe 'Productモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '商品名が空の場合' do
      it 'バリデーションにひっかる' do
        product = Product.new(name: '', price: '10000',picture: 'app/assets/images/test.jpg')
        expect(product).not_to be_valid
      end
    end
　　context '値段が空の場合' do
      it 'バリデーションにひっかかる' do
        product = Product.new(name: '失敗テスト', price: '',picture: 'app/assets/images/test.jpg')
        expect(product).not_to be_valid
      end
    end
    context 'Pictureが空の場合' do
      it 'バリデーションにひっかかる' do
        product = Product.new(name: '失敗テスト', price: '10000',picture: '')
        expect(product).not_to be_valid
      end
    end
    context 'Productのnameとpriceとpictureに内容が記載されている場合' do
      it 'バリデーションが通る' do
        product = Product.new(name: '成功テスト', price: '10000',picture: 'app/assets/images/test.jpg')
        expect(product).to be_valid
      end
    end
  end
end
