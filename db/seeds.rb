Faker::Config.locale = :ja
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lady = Category.create( name: "レディース" )
men = Category.create( name: "メンズ" )
baby = Category.create( name: "べビー・キッズ" )
interior = Category.create( name: "インテリア・住まい・小物" )
book = Category.create( name: "本・音楽・ゲーム" )
toy = Category.create( name: "おもちゃ・ホビー・グッズ" )
cosme = Category.create( name: "コスメ・香水・美容" )
phone = Category.create( name: "家電・スマホ・カメラ" )
sports = Category.create( name: "スポーツ・レジャー" )
handmade = Category.create( name: "ハンドメイド" )
ticket = Category.create( name: "チケット" )
car = Category.create( name: "自動車・オートバイ" )
etc = Category.create( name: "その他" )
list = Category.create( name: "カテゴリー一覧" )

lady_tops = lady.children.create( name: "トップス")
lady_jacket = lady.children.create( name: "ジャケット/アウター")

lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "その他"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])


men_tops = men.children.create( name: "トップス")
men_jacket = men.children.create( name: "ジャケット/アウター")
men_pants = men.children.create( name: "パンツ")

men_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "その他"}])
men_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])