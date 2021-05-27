# テーブル設計

＃＃usersテーブル(ユーザー情報)

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| nickname           | string  | null: false                   |
| email              | string  | null: false, unique: true     |
| encrypted_password | string  | null: false                   |
| family_name        | string  | null: false                   |
| first_name         | string  | null: false                   |
| family_name_kana   | string  | null: false                   |
| first_name_kana    | string  | null: false                   |
| birth_day          | date    | null: false                   |

Association
・has_many :products
・has_many :card


##itemテーブル(出品中の商品情報)

| Column              | Type    | Options                        | 
| -----------         | ------- | ------------------------------ |
| product_name        | string  | null: false                    |
| product_description | text    | null: false                    |
| category_id         | integer | null: false                    |
| condition_id        | integer | null: false                    |
| cost_id             | integer | null: false                    |
| area_id             | integer | null: false                    |
| day_id              | integer | null: false                    |
| price               | integer | null: false                    |
| user_id             | integer | null: false, foreign_key: true |

Association
・belongs_to :user


##cardテーブル(購入記録)

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | string  | null: false, foreign_key: true |
| item_id             | string  | null: false, foreign_key: true |

Association
・belongs_to :user
・has_one :destination

##destinationテーブル(発送先情報)

| Column              | Type    | Options         |
| -----------         | ------- | --------------- |
| postal_code         | string  | null: false     |
| prefecture_id       | integer | null: false     |
| city                | string  | null: false     |
| address             | string  | null: false     |
| building_name       | string  |                 |
| phone_number        | string  | null: false     |
| card_id             | sering  | null: false, foreign_key: true |

Association
・belongs_to :card