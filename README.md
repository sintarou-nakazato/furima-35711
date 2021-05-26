# テーブル設計

＃＃usersテーブル(ユーザー情報)

| Column           | Type    | Options         |
| -----------      | ------- | --------------- |
| nickname         | string  | null: false     |
| email            | string  | null: false     |
| password         | string  | null: false     |
| family_name      | string  | null: false     |
| first_name       | string  | null: false     |
| family_name_kana | string  | null: false     |
| first_name_kana  | string  | null: false     |
| birth_day        | date    | null: false     |

Association
・has_many :products
・has_one :card
・has_one :destination


##productテーブル(出品中の商品情報)

| Column              | Type    | Options         |
| -----------         | ------- | --------------- |
| user_image          | string  |                 |
| product_name        | string  | null: false     |
| product_description | string  | null: false     |
| category            | string  | null: false     |
| product_condition   | string  | null: false     |
| shipping_cost       | string  | null: false     |
| shipping_area       | string  | null: false     |
| shipping_days       | string  | null: false     |
| price               | string  | null: false     |

Association
・belongs_to :user


##cardテーブル(購入記録)

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | string  | null: false, foreign_key: true |
| card_id             | string  | null: false, foreign_key: true |

Association
・belongs_to :user

##destinationテーブル(発送先情報)

| Column              | Type    | Options         |
| -----------         | ------- | --------------- |
| postal_code         | string  | null: false     |
| prefectures         | string  | null: false     |
| city                | string  | null: false     |
| address             | string  | null: false     |
| building_name       | string  |                 |
| phone_number        | string  | null: false     |

Association
・belongs_to :user