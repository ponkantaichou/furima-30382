# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| last_name_kanji    | string              | null: false             |
| first_name_kanji   | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |


### Association

* has_many :items
* has_many :comments
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |
| item_status_id                      | integer    | null: false       |
| shipping_id                         | integer    | null: false       |
| shipment_source_id                  | integer    | null: false       |
| shipping_day_id                     | integer    | null: false       |
| category_id                         | integer    | null: false       |

### Association

- belongs_to :user
- has_many :comments
- has_one : order

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :item
- has_one : address
- belongs_to :user

## address table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| order          | references | foreign_key: true |

### Association
- belongs_to :order