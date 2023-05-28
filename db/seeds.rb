# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#アドミン初期登録
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
Customer.create!(
   last_name: "山田",
   first_name: "太郎",
   last_kana: "ヤマダ",
   first_kana: "タロウ",
   email: "yamada.taro@gmail.com",
   postcode: "1234567",
   address: "東京都港区1-1-1",
   phone_number: "09012345678",
   password: "111111",
   )

Customer.create!(
   last_name: "もこ",
   first_name: "すすす",
   last_kana: "モコ",
   first_kana: "ススス",
   postcode: "1234568",
   address: "日本東京1-2-3",
   phone_number: "09012345688",
   email: "a@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "こー",
   first_name: "いち",
   last_kana: "コー",
   first_kana: "イチ",
   postcode: "9631123",
   address: "日本福島1-2-3",
   phone_number: "09098765432",
   email: "b@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "ありー",
   first_name: "さか",
   last_kana: "アリ",
   first_kana: "サカ",
   postcode: "1472583",
   address: "日本横浜1-2-3",
   phone_number: "09011122348",
   email: "c@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "しばたん",
   first_name: "しばたん",
   last_kana: "シバタン",
   first_kana: "シバタン",
   postcode: "9876543",
   address: "日本大阪1-2-3",
   phone_number: "09098724561",
   email: "d@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "佐藤",
   first_name: "健",
   last_kana: "サトウ",
   first_kana: "タケル",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "e@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "高橋",
   first_name: "一生",
   last_kana: "タカハシ",
   first_kana: "イッセイ",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "f@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "松下",
   first_name: "菜々子",
   last_kana: "マツシタ",
   first_kana: "ナナコ",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "g@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "小松",
   first_name: "菜奈",
   last_kana: "コマツ",
   first_kana: "ナナ",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "h@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "菅田",
   first_name: "将暉",
   last_kana: "スダ",
   first_kana: "マサキ",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "i@gmail.com",
   password: "111111",
   )

   Customer.create!(
   last_name: "yonezu",
   first_name: "kenshi",
   last_kana: "ヨネズ",
   first_kana: "ケンシ",
   postcode: "1234568",
   address: "日本品川1-2-3",
   phone_number: "09012345688",
   email: "j@gmail.com",
   password: "111111",
   )


#商品初期登録
genre = Genre.find_by(name: "ケーキ")
item1 = Item.new(
   name:"ショコラ オランジュケーキ(ホール）",
   introduction:"しっとり濃厚なチョコレートにオレンジの酸味が効いた大人のチョコレートケーキです",
   genre_id: genre.id,
   without_tax: 3000,
   sale_status:0
   )
item1.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_1.jpg')), filename: 'cake_1.jpg')
item1.save!

item2 = Item.new(
   name:"苺のムースタルト（ホール）",
   introduction:"甘酸っぱい苺を贅沢に使用 新鮮な苺たっぷりのタルト。甘酸っぱくジューシーな苺と自家製カスタードクリーム、誰もが大好きな組み合わせです",
   genre_id: genre.id,
   without_tax: 3500,
   sale_status:0
   )
item2.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_2.jpg')), filename: 'cake_2.jpg')
item2.save!

item3 = Item.new(
   name:"苺のムースタルト（1カット）",
   introduction:"甘酸っぱい苺を贅沢に使用 新鮮な苺たっぷりのタルト。甘酸っぱくジューシーな苺と自家製カスタードクリーム、誰もが大好きな組み合わせです",
   genre_id: genre.id,
   without_tax: 450,
   sale_status:0
   )
item3.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_3.jpg')), filename: 'cake_3.jpg')
item3.save!

item4 = Item.new(
   name:"レモンのレアチーズケーキ（1カット）",
   introduction:"レモンの酸味とサッパリとしたチーズの風味がたまらない夏にピッタリの商品です。",
   genre_id: genre.id,
   without_tax: 450,
   sale_status:0
   )
item4.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_4.jpg')), filename: 'cake_4.jpg')
item4.save!

item5 = Item.new(
   name:"チョコミントカップケーキ",
   introduction:"チョコミントクリームをたっぷり乗せたカップケーキです",
   genre_id: genre.id,
   without_tax: 450,
   sale_status:0
   )
item5.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_5.jpg')), filename: 'cake_5.jpg')
item5.save!

item6 = Item.new(
   name:"抹茶ミルクレープ（1カット）",
   introduction:"京都宇治抹茶を混ぜ込んだ上品な甘さのミルクレープです",
   genre_id: genre.id,
   without_tax: 450,
   sale_status:0
   )
item6.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_6.jpg')), filename: 'cake_6.jpg')
item6.save!

genre = Genre.find_by(name: "焼き菓子")
item7 = Item.new(
   name:"カスタードシュークリーム",
   introduction:"北アルプス山麓でのびのび育った牛の乳とこだわりの卵で作ったカスタードクリームを高温でサクッと焼き上げたシューに合わせました",
   genre_id: genre.id,
   without_tax: 400,
   sale_status:0
   )
item7.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi_1.jpg')), filename: 'yakigashi_1.jpg')
item7.save!

item8 = Item.new(
   name:"マカロン（1箱6個入り）",
   introduction:"外側がカリっとしていて中が柔らかく、香り豊かでとろけるような中身のマカロンは、 パートダマンドをベースにメレンゲを加えて作られます",
   genre_id: genre.id,
   without_tax: 400,
   sale_status:0
   )
item8.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi_2.jpg')), filename: 'yakigashi_2.jpg')
item8.save!

genre = Genre.find_by(name: "プリン")
item9 = Item.new(
   name:"苺のジュレプリン",
   introduction:"新鮮な苺をジュレにし、こだわりの卵で作ったプリンと合わせました。3月から5月までの期間限定商品です。",
   genre_id: genre.id,
   without_tax: 350,
   sale_status:1
   )
item9.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding_1.jpg')), filename: 'pudding_1.jpg')
item9.save!

genre = Genre.find_by(name: "キャンディ")
item10 = Item.new(
   name:"季節の金平糖（夏）",
   introduction:"昔懐かしい金平糖で四季を感じて下さい",
   genre_id: genre.id,
   without_tax: 250,
   sale_status:0
   )
item10.image.attach(io: File.open(Rails.root.join('app/assets/images/candy_1.jpg')), filename: 'candy_1.jpg')
item10.save!





