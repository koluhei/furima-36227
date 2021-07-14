# テーブル設計

## users テーブル

| Column                | Type       | Options                                   |
| --------------------- | ---------- | ----------------------------------------- |
| nickname              | string     | null: false                               |
| email                 | string     | null: false                               |
| encrypted_password    | string     | null: false, format:{/\A[a-zA-Z0-9]+\z/}  |
| password_confirmation | string     | null: false                               |
| last_name             | string     | null: false, format:{/\A[ぁ-んァ-ン一-龥]/} |
| first_name            | string     | null: false, format:{/\A[ぁ-んァ-ン一-龥]/} |
| l_kana                | string     | null: false, format:{/\A[ァ-ヶー－]+\z/}   |
| f_kana                | string     | null: false, format:{/\A[ァ-ヶー－]+\z/}   |
| birth_year            | integer    | null: false                               |
| birth_month           | integer    | null: false                               |
| birth_day             | integer    | null: false                               |
| item_id               | references | foreign_key: true                         |
| sold_log_id           | references | foreign_key: true                         |

### Association
- has_many :items
- has_many :sold_logs



## items テーブル

| Column             | Type         | Options                                                                               |
| ------------------ | ------------ | ------------------------------------------------------------------------------------- |
| image              | ActiveStrage | null: false                                                                           |
| name               | string       | null: false                                                                           |
| description        | text         | null: false                                                                           |
| category_id        | integer      | null: false                                                                           |
| status             | string       | null: false                                                                           | 
| delivary_charge_id | integer      | null: false                                                                           |
| ship_from_id       | interger     | null: false                                                                           |
| days_to_ship_id    | integer      | null: false                                                                           |
| price              | integer      | null: false, numericality:{greater_than_or_equal}, {less_than_or_equal_to 9999999999} |
| user_id            | references   | null: false, foreign_key: true                                                        |
| sold_log_id        | references   | null: false, foreign_key: true                                                        |

### Association
- belongs_to :user
- has_one :sold_log



## sold_logs テーブル

| Column        | Type       | Options                                            |
| ------------- | ---------- | -------------------------------------------------- |
| postal_number | integer    | null: false  format: {/\A\d{3}[-]\d{4}\z/}         |
| prefecture_id | integer    | null: false                                        |
| city          | string     | null: false                                        |
| address       | string     | null: false                                        |
| building      | string     |                                                    | 
| phone_number  | integer    | null: false  format: {/\A\d{3}[-]\d{4}[-]\d{4}\z/} |
| user_id       | references | null: false, foreign_key: true                     |
| sold_log_id   | references | null: false, foreign_key: true                     |

### Association
- belongs_to :user
- belongs_to :item

