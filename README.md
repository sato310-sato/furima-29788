# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## comments テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column    | Type       | Options                        |
| ----------| -----------| -------------------------------|
| name      | string     | null: false                    |
| category  | string     | null: false                    |
| price     | string     | null: false                    |
| item_text | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| -----------------| -----------| -------------------------------|
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user


## shopping_addresses テーブル

| Column       | Type    | Options     |
| -------------| --------| ------------|
| postal_code  | string  | null: false |
| prefectures  | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  | null: false |
| phone_number | string  | null: false |

### Association

- has_many :orders
