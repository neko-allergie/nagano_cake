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

#商品初期登録
#ケーキの商品
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
   without_tax: 400,
   sale_status:0
   )
item3.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_3.jpg')), filename: 'cake_3.jpg')
item3.save!

item4 = Item.new(
   name:"レモンのレアチーズケーキ（1カット）",
   introduction:"レモンの酸味とサッパリとしたチーズの風味がたまらない夏にピッタリの商品です。",
   genre_id: genre.id,
   without_tax: 400,
   sale_status:0
   )
item4.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_4.jpg')), filename: 'cake_4.jpg')
item4.save!

item5 = Item.new(
   name:"チョコミントカップケーキ",
   introduction:"チョコミントクリームをたっぷり乗せたカップケーキです",
   genre_id: genre.id,
   without_tax: 400,
   sale_status:0
   )
item5.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_5.jpg')), filename: 'cake_5.jpg')
item5.save!

genre = Genre.find_by(name: "焼き菓子")
item6 = Item.new(
   name:"カスタードシュークリーム",
   introduction:"北アルプス山麓でのびのび育った牛の乳とこだわりの卵で作ったカスタードクリームを高温でサクッと焼き上げたシューに合わせました",
   genre_id: genre.id,
   without_tax: 400,
   sale_status:0
   )
item6.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi_1.jpg')), filename: 'yakigashi_1.jpg')
item6.save!

genre = Genre.find_by(name: "プリン")
item7 = Item.new(
   name:"苺のジュレプリン",
   introduction:"新鮮な苺をジュレにし、こだわりの卵で作ったプリンと合わせました。3月から5月までの期間限定商品です。",
   genre_id: genre.id,
   without_tax: 350,
   sale_status:1
   )
item7.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding_1.jpg')), filename: 'pudding_1.jpg')
item7.save!

genre = Genre.find_by(name: "キャンディ")
item8 = Item.new(
   name:"季節の金平糖（夏）",
   introduction:"昔懐かしい金平糖で四季を感じて下さい",
   genre_id: genre.id,
   without_tax: 250,
   sale_status:0
   )
item8.image.attach(io: File.open(Rails.root.join('app/assets/images/candy_1.jpg')), filename: 'candy_1.jpg')
item8.save!


