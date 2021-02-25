# cake_skill_log の ER 図

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| name               | string | null:false             |
| email              | string | unique:true,null:false |
| encrypted_password | string | null:false             |

### Association

- has_many skills
- has_many comments
- has_many user_messages
- has_one purchase

## skills テーブル

| Column           | Type      | Options           |
| ---------------- | --------- | ----------------- |
| name             | string    | null:false        |
| category_id      | integer   | null:false        |
| formulation_text | text      | null:false        |
| recipe_text      | text      | null:false        |
| user             | reference | foreign_key: true |

### Association

- belongs_to user
- has_many comments

## comments テーブル

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| text   | text      | null:false        |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association

- belongs_to user
- belongs_to skill

## rooms テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users

users テーブル

| Column  | Type      | Options           |
| ------- | --------- | ----------------- |
| user    | reference | foreign_key: true |
| message | reference | foreign_key: true |

### Association

- belongs_to user
- belongs_to message

## messages テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| text         | text      | null:false        |
| user_id      | reference | foreign_key: true |
| room_user_id | reference | foreign_key: true |

### Association

- has_many user_messages

## purchases テーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| purchase_token | string    | null:false        |
| customer_token | string    | null:false        |
| user           | reference | foreign_key: true |

### Association

- belongs_to user
