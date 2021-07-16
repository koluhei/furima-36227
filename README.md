# テーブル設計

## users テーブル

| Column                | Type       | Options                   |
| --------------------- | ---------- | ------------------------- |
| nickname              | string     | null: false               |
| email                 | string     | null: false, unique: true |
| encrypted_password    | string     | null: false               |
| last_name             | string     | null: false               |
| first_name            | string     | null: false               |
| l_kana                | string     | null: false               |
| f_kana                | string     | null: false               |
| birthday              | date       | null: false               |

### Association
- has_many :items
- has_many :sold_logs



## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| name               | string       | null: false                    |
| description        | text         | null: false                    |
| category_id        | integer      | null: false                    |
| status_id          | integer      | null: false                    |
| delivery_charge_id | integer      | null: false                    |
| prefecture_id      | integer      | null: false                    |
| days_to_ship_id    | integer      | null: false                    |
| price              | integer      | null: false                    | 
| user               | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :sold_log



## sold_logs テーブル
（user_idで購入者、item_idで購入したものと出品者を管理）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true | 
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_number | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                | 
| phone_number  | string     | null: false                    |
| sold_log      | references | null: false, foreign_key: true |

### Association
- belongs_to :sold_log