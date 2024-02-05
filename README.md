# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |

- has_many :buying_histories
- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| detail             | text       | null: false                    |
| price              | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                     |
| load_style_id      | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :buying_history
- has_one address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| bill_name          | string     |                                |
| phone_number       | string     | null: false                    |

- belongs_to :item


## buying_historiesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
