FactoryBot.define do
  factory :post_content do
    name { Faker::Lorem.characters(number:10) }
    main_images { [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))] }
    customer
  end
end