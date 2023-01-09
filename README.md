# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association
- has_many :items
- has_many :comments


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

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| image              | text       | null: false                   |
| name               | string     | null: false                   |
| item_description   | text       | null: false                   |
| category           | string     | null: false                   |
| condition          | string     | null: false                   |
| freight            | string     | null: false                   |
| ship_from_location | string     | null: false                   |
| delivery_time      | string     | null: false                   |
| price              | string     | null: false                   |
| user               | references | null: false foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user
- belongs_to :order


## orders テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| buyers             | references | null: false foreign_key: true |
| item               | references | null: false foreign_key: true |

### Association
- has_one    :item
- has_one    :buyer


## buyers テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| postal_code    | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building       | string | null: false |
| phone          | string | null: false |

### Association
- belongs_to :order
