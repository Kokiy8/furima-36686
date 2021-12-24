# README

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| password           | string | null: false                   |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| DOB                | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |

## Association

- has_many :items
- has_many :records

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| image           | blob      | null: false                    |
| item_name       | string    | null: false                    |
| description     | text      | null: false                    |
| category        | string    | null: false                    |
| condition       | string    | null: false                    |
| delivery_charge | string    | null: false                    |
| area            | string    | null: false                    |
| price           | string    | null: false                    |
| user            | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| item_name | string    | null: false                    |
| user      | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| post_code        | string | null: false |
| prefectures      | string | null: false |
| municipalities   | string | null: false |
| address          | string | null: false |
| building_name    | string | null: false |
| telephone_number | string | null: false |

## Association

- has_many :records