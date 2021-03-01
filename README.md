# アプリケーション名

<br>

## CakeLog

https://gyazo.com/77bf4119042daf4dc33831b3c9f93686

# 概要

<br>

ケーキ作り投稿、閲覧アプリケーション。
ケーキの技術を身につけたい、調べたい、共有したい人に向けたい人のサービスです。

# URL

<br>

https://cake-skill-log.herokuapp.com/

ログイン情報(テスト用)

- Email c@com
- Pass 11111a

# 制作背景(意図)

<br>
　自分が元ケーキ職人をしていて、知り合いのケーキ職人が「技術をもっとほしい」という一言から、効率よくケーキのインプット、アウトプットできるようにするために開発しました。

## 現状

- 技術を身につけるまで、熟練が必要です。
- 日々の作業だけになって、技術向上の疑問や、考えることを忙しくて疎かにしてしまいます。

## 課題、問題点

- 技術を身につけるまですごい時間がかかリます。

## 解決策

- ケーキ作りのインプットとアウトプットのサイクルをまずは頭のなから、生産性を上げます。手を使っての再現性を高速化する。

# 機能一覧

<br>

- ランディングページ

https://gyazo.com/3352d2bfd85208dd82db7f7a0ac80a31

- ログイン、ログアウト機能(gem devise)

https://gyazo.com/bee1391e672c6eec1559cd04679f15e3

- ケーキレシピを投稿

https://gyazo.com/ea8774c7731f6453395c323e7673e0b7

- ケーキレシピを編集機能

https://gyazo.com/4f9b6bee728559540815d0049552bc99

- ケーキレシピを削除機能

https://gyazo.com/185bdf11a5b416bfd89879eeac6a131c

- 投稿詳細画面でコメント機能

https://gyazo.com/0e90fa68ff8b4ac07c8fd652c80005e7

# 使用技術

<br>

## フロントエンド

---

- HTML
- CSS
- Bootstrap4
- JavaScript

## バックエンド

---

- Ruby2.6.5
- Ruby on Rails 6.0.3/4

## データベース

---

- MySQL2

## テスト

---

- RSpec
- FactoryBot

## 本番環境

---

- AWS(S3)
- heroku

## ソース管理

---

- GitHub,GitHubDesktop

# 実装予定の機能

<b s>
- ユーザー同士のメッセージ機能
- ロゴ作成
- Font Awesome でアイコン導入
- 投稿にいいね機能
- ユーザーをフォローする機能
- 検索機能
- 登録されたデータを検索
- ユーザー管理機能のアカウント変更機能
- お気にいり機能
- アプリケーション利用クレジット決済機能

# DB 設計

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

## user_messages テーブル

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association

- belongs_to user
- belongs_to message

## messages テーブル

| Column          | Type      | Options           |
| --------------- | --------- | ----------------- |
| text            | text      | null:false        |
| user_id         | reference | foreign_key: true |
| user_message_id | reference | foreign_key: true |

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
