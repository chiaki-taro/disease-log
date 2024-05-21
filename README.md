# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :patients


## patients テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| patient_name     | string     | null: false                    |
| sex_id           | integer    | null: false                    |
| birthday         | date       | null: false                    |

### Association

- belongs_to :user
- has_many :diseases


## diseases テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| patient          | references | null: false, foreign_key: true |
| disease_name     | string     | null: false                    |
| date_of_onset    | datetime   | null: false                    |
| status_id        | integer    | null: false                    |

### Association

- belongs_to :patient
- has_many :symptoms


## symptoms テーブル
| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| disease          | references | null: false, foreign_key: true |
| symptoms         | string     | null: false                    |
| time             | datetime   | null: false                    |
| level_id         | integer    | null: false                    |
| treatment        | text       |                                |
| evaluation       | text       |                                |
| memo             | text       |                                |

- belongs_to :disease