FactoryBot.define do
  factory :product do
    name { 'test_title' }
    price { '10000' }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.jpg'))}
    user
  end
end
