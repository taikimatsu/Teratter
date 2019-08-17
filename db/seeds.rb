# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Goriyaku.create(
[
	{name: '--未選択--'},
	{name: '縁結び・恋愛成就'},
	{name: '安産・子宝'},
	{name: '合格祈願・学業成就'},
	{name: '金運'},
	{name: '家内安全・夫婦円満'},
	{name: '商売繁盛'},
	{name: '健康祈願・病気平癒'},
	{name: 'おもしろご利益'},
	{name: '勝運・出世'},
	{name: '交通安全'},
	{name: '諸願成就'},
	{name: 'その他パワースポット'}
]
)

Prefecture.create(
[
	{name: '--未選択--'},{name: '北海道'},{name: '青森県'},{name: '岩手県'},{name: '宮城県'},
	{name: '秋田県'},{name: '山形県'},{name: '福島県'},{name: '茨城県'},{name: '栃木県'},
	{name: '群馬県'},{name: '埼玉県'},{name: '千葉県'},{name: '東京都'},{name: '神奈川県'},
	{name: '新潟県'},{name: '富山県'},{name: '石川県'},{name: '福井県'},{name: '山梨県'},
	{name: '長野県'},{name: '岐阜県'},{name: '静岡県'},{name: '愛知県'},{name: '三重県'},
	{name: '滋賀県'},{name: '京都府'},{name: '大阪府'},{name: '兵庫県'},{name: '奈良県'},
	{name: '和歌山県'},{name: '鳥取県'},{name: '島根県'},{name: '岡山県'},{name: '広島県'},
	{name: '山口県'},{name: '徳島県'},{name: '香川県'},{name: '愛媛県'},{name: '高知県'},
	{name: '福岡県'},{name: '佐賀県'},{name: '長崎県'},{name: '熊本県'},{name: '大分県'},
	{name: '宮崎県'},{name: '鹿児島県'},{name: '沖縄県'},

]
)
