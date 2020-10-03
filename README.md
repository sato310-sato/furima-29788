# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |
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

| Column                | Type       | Options                        |
| ----------------------| -----------| -------------------------------|
| name                  | string     | null: false                    |
| category_id           | integer    | null: false                    |
| price                 | integer    | null: false                    |
| item_text             | text       | null: false                    |
| delivery_free_id      | integer    | null: false                    |
| product_condition_id  | integer    | null: false                    |
| delivery_source_id    | integer    | null: false                    |
| estimated_delivery_id | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- has_one_attached :image

## orders テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shopping_address

## shopping_addresses テーブル

| Column       | Type       | Options                         |
| -------------| -----------| --------------------------------|
| postal_code  | string     | null: false                     |
| prefectures  | integer    | null: false                     |
| city         | string     | null: false                     |
| addresses    | string     | null: false                     |
| building     | string     |                                 |
| phone_number | string     | null: false                     |
| order        | references | null: false, foreign_key: true  |

### Association

- belongs_to :order
