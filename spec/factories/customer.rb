FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    name { 'noname' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end