# README

## 使用技術
| 言語・フレームワーク  | バージョン |
| --------------------- | ---------- |
| ruby                  | 3.2.0      |
| rails                 | 7.0.0      |
| MySQL                 | 14.14      |

## サービスのURL
https://disease-log.onrender.com/
実際に触っていただくためにユーザーを準備しております。<br/>
ユーザー名: テストユーザー<br/>
email: abc@efg<br/>
password: qaz123<br/>

## サービスの概要・開発した背景
私はこれまで看護師として働いてきました。医療現場でコミュニケーションを取る中で、全員が当たり前のように会話ができないことを知りました。<br/>
開発の背景には、表現の難しい患者さんの症状を的確に伝えることで、適切な治療を受けられるようにしたいという思いがあります。<br/>
DiseaseLogは、声を発することができない人や症状の強さをうまく表現しにくい人が、5段階の表情の絵を使って症状を記録できるアプリです。<br/>
簡単に日々の症状を記録し、医療従事者とのコミュニケーションをサポートします。<br/>
さらに、近くの病院を探す機能も搭載しており、病院に行った際にはアプリに記録された症状を医師に見せることができます。<br/>

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