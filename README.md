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

| Column             | Type       | Options                        |
| -------------------| -----------| -------------------------------|
| name               | string     | null: false                    |
| category           | string     | null: false                    |
| price              | integer    | null: false                    |
| item_text          | string     | null: false                    |
| delivery_free      | string     | null: false                    |
| product_condition  | string     | null: false                    |
| delivery_source    | string     | null: false                    |
| estimated_delivery | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- has_many :item_item_categories
- has_many :item_categories.through:item_item_categories

## item_item_categories テーブル

| Column        | Type       | Options                        |
| --------------| -----------| -------------------------------|
| item_category | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :item_category

## item_categories テーブル

| Column    | Type       | Options      |
| ----------| -----------| -------------|
| category  | string     |  null: false |

- has_many :item_item_categories
- has_many :items.through:item_item_categories

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
| postal_code  | integer    | null: false                     |
| prefectures  | integer    | null: false                     |
| city         | string     | null: false                     |
| addresses    | string     | null: false                     |
| building     | string     |                                 |
| phone_number | string     | null: false                     |
| order        | references | null: false, foreign_key: true  |

### Association

- belongs_to :order
