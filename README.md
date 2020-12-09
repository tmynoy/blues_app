# Blues App
このツールはチェルシーファン同士で交流することができます。
みんなでチェルシーを応援しよう！！

# Description
選手の情報や評価を閲覧できます。
そして、各試合ごとのチャットルームで他ユーザーとトークができます。

# URL
https://blues-app.herokuapp.com/

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association
- has_many :comments
- has_many :evaluations
- has_many :messages


## members テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| nation             | string  | null: false |
| ord                | date    | null: false |
| position           | string  | null: false |
| zone               | string  | null: false |
| height             | string  | null: false |
| weight             | string  | null: false |
| foot               | string  | null: false |
| backnumber         | string  | null: false |
| image              | string  | null: false |

### Association
- has_many :comments
- has_many :evaluations


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| member             | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :member
- belongs_to :user


## evaluations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| total_id           | integer    | null: false                    |
| offence_id         | integer    | null: false,                   |
| deffence_id        | integer    | null: false,                   |
| pass_id            | integer    | null: false,                   |
| dribble_id         | integer    | null: false,                   |
| physical_id        | integer    | null: false,                   |
| pace_id            | integer    | null: false,                   |
| member             | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :total
- belongs_to :offence
- belongs_to :deffence
- belongs_to :pass
- belongs_to :dribble
- belongs_to :physical
- belongs_to :pace
- belongs_to :user
- belongs_to :member


## rooms テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| room_name          | string  | null: false |
| home_away          | string  | null: false |
| match_day          | date    | null: false |
| match_time         | time    | null: false |

### Association
- has_many :messages


## messages テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| room               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user