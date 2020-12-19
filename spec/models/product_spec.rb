require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
    context 'Productのpriceが空の場合' do
      @product = Product.new(name: '', price: '10000', picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')
      expect(@product).not_to be_valid
      end
    end
    context 'Productのpriceが空の場合' do
      it 'バリデーションにひっかかる' do
      @product = Product.new(name: '失敗テスト', price: '', picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')
      expect(@product).not_to be_valid
      end
    end
    context 'Productのpictureが空の場合' do
       it 'バリデーションにひっかかる' do
        @product = Product.new(name: '失敗テスト', price: '10000', picture: '')
        expect(@product).not_to be_valid
      end
    end
  end
end
