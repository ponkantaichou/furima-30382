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
| birthday           | string              | null: false             |


### Association

* has_many :items
* has_many :comments

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item_name                           | string     | null: false       |
| item_description                    | text       | null: false       |
| item_price                          | text       | null: false       |
| user_id                             | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one : order

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| purchase_history | text       | null: false       |
| item_id          | references | foreign_key: true |
| user_id          | references | foreign_key: true |

### Association

- belongs_to :item
- has_one : address

## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| address     | text       | null: false       |
| items_id    | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association
- belongs_to :order