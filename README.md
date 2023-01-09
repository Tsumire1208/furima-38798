# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nick_name          | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_date         | date   | null: false              |

### Association
- has_many :items
- has_many :comments
- has_one :order


## comments テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| item               | references | null: false foreign_key: true |
| comment            | text       | null: false                   |

### Association
- belongs_to :item
- belongs_to :user


## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| name                  | string     | null: false                   |
| item_description      | text       | null: false                   |
| category_id           | integer    | null: false                   |
| condition_id          | integer    | null: false                   |
| freight_id            | integer    | null: false                   |
| ship_from_location_id | integer    | null: false                   |
| delivery_time_id      | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user
- has_one :order


## orders テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| item               | references | null: false foreign_key: true |

### Association
- belongs_to    :item
- belongs_to    :user
- has_one       :buyer


## buyers テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | integer    | null: false                   |
| prefectures         | string     | null: false                   |
| municipalities      | string     | null: false                   |
| address             | string     | null: false                   |
| building            | string     |                               |
| phone               | integer    | null: false                   |
| order               | references | null: false foreign_key: true |

### Association
- belongs_to :order
