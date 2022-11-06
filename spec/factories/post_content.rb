FactoryBot.define do
  factory :post_content do
    name { Faker::Lorem.characters(number:10) }
    main_images { [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))] }
    prefectures { ["東京都","北海道","沖縄県","大阪府"].sample }
    description { "" }
    address { "東京都新宿区" }
    customer
  end
end