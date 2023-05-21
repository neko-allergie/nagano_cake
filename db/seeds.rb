# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@gmail.com',
   password: 'adminpass',
)

# ジャンル初期登録
Genre.create!(name: "ケーキ")
Genre.create!(name: "プリン")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "キャンディ")

# 顧客データ初期登録
Customer.create!(last_name: "山田",
   first_name: "太郎",
   last_kana: "ヤマダ",
   first_kana: "タロウ",
   email: "yamada.taro@gmail.com",
   postcode: "1234567",
   address: "東京都港区1-1-1",
   phone_number: "09012345678",
   password: "111111")