# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |

### Association
- has_many :categories_users
- has_many :categories, through: category_users
- has_many :comments

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | text   | null: false |

### Association
- has_many :categories_users
- has_many :users, through: category_users
- has_many :comments

##  categories_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category

##  comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| category| references | null: false, foreign_key: true |

### Association
- belongs_to :category
- belongs_to :user