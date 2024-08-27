#テーブルの設計

##usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| encrypted_password | string     | null: false |
| email              | string     | null: false, unique: true |

has_one :memo
has_one :book

##memosテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| category_id        | integer    | null: false |
| text               | text       | null: false |
| quantity           | integer    | null: false |

belongs_to :user

##booksテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| category_id        | integer    | null: false |
| text               | text       | null: false |
| price              | integer    | null: false |

belongs_to :user