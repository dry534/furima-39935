# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| name               | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |

- has_many :buying_history
- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| detail             | text       | null: false                    |
| location           | string     | null: false                    |
| price              | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| load_style_id      | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| location_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :buying_history

## address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| bill_name          | string     | null: false                    |
| phone_number       | integer    | null: false                    |




## buying_historyテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
