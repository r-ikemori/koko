# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
    email: 'admin@admin.com',
    password: 'password',
)


customer = Customer.create(
  email: 'olivia@test.com',
  name: 'Olivia',
  password: 'password'
  )
customer.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")

#customers = Customer.create!(
#  [
#    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
#    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
#    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
#  ]
#)

#PostContent.find_or_create_by!(
#  [
#    {name: '綺麗な泉', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),prefectures: '東京都',address: '東京都八王子',latitude: '35.69941694698122',longitude: '139.20935698113516', description: '綺麗な泉です。', customer_id: customers[1].id },
#    {name: '煎餅屋', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"),prefectures: '東京都',address: '東京都八王子市上柚木２１６−１',latitude: '35.617786310373994',longitude: '139.36299060230118', description: '美味しいです！', customer_id: customers[2].id },
#    {name: '神秘的な森', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"),prefectures: '東京都',address: '東京都八王子市裏高尾町１２８８−３',latitude: '35.641673184600585',longitude: '139.24243927001953', description: '神秘的な森です！', customer_id: customers[3].id }
#  ]
#)