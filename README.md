# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| ----------| ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## comments テーブル

| Column | Type   | Options     |
| -------| ------ | ----------- |
| text   | string | null: false |
| user   | string | null: false |
| item   | string | null: false |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column   | Type   | Options     |
| ---------| -------| ------------|
| item     | string | null: false |
| category | string | null: false |
| price    | string | null: false |
| image    | string | null: false |
| user     | string | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :orders

## orders テーブル

| Column           | Type   | Options     |
| -----------------| -------| ------------|
| item             | string | null: false |
| user             | string | null: false |
| shopping_address | string | null: false |


### Association

- belongs_to :item
- belongs_to :user


## shopping_addresses テーブル

| Column           | Type   | Options     |
| -----------------| -------| ------------|
| shopping_address | string | null: false |


### Association

- has_many :orders
