# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday_year         | string | null: false |
| birthday_month        | string | null: false |
| birthday_day          | string | null: false |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| image                     | string     | null: false                    |
| name                      | string     | null: false                    |
| description               | text       | null: false                    |
| price                     | integer    | null: false                    |
| category                  | string     | null: false                    |
| sipping_charges           | integer    | null: false                    |
| sipping_area              | string     | null: false                    |
| Estimated_shipping_date   | string     | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_records


## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_one :shipping_address


## shipping_address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| province         | string     | null: false |
| city             | string     | null: false |
| address_Line1    | string     | null: false |
| address_Line2    | string     |             |
| phone_number     | string     | null: false |


### Association

- belongs_to :purchase_records