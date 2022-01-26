# README

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| dob                | date   | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| ruby_last_name     | string | null: false                   |
| ruby_first_name    | string | null: false                   |

## Association

- has_many :items
- has_many :records

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item_name          | string    | null: false                    |
| description        | text      | null: false                    |
| category_id        | integer   | null: false                    |
| condition_id       | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| days_to_id         | integer   | null: false                    |
| prefecture_id     | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| item      | reference | null: false, foreign_key: true |
| user      | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| post_code        | string    | null: false                    |
| prefectures_id   | integer   | null: false                    |
| municipalities   | string    | null: false                    |
| address          | string    | null: false                    |
| building_name    | string    |                                |
| telephone_number | string    | null: false                    |
| record           | reference | null: false, foreign_key: true |

## Association

- belongs_to :record