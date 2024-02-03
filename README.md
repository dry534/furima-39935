# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| name               | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |
| encrypted_password | string | null: false |


- has_many :items
- has_many

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item name          | string     | null: false                    |
| detail             | text       | null: false                    |
| location           | string     | null: false                    |
| prise              | string     | null: false                    |
| situation          | string     | null: false                    |
| delivery_days      | string     | null: false                    |
| load_style         | string     | null: false                    |
| category           | string     | null: false                    |
| location           | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :users
- has_one :address

## address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | text       | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| bill_name          | string     | null: false                    |


- belongs_to :users
- belongs_to :items