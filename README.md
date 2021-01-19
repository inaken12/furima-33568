# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| expiration_date_mm | date       | null: false                    |
| expiration_date_yy | date       | null: false                    |
| security_code      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zipcode        | string     | null: false                    |
| state          | string     | null: false                    |
| city           | string     | null: false                    |
| address_line_1 | text       | null: false                    |
| address_line_2 | text       |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item