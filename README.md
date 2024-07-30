# README

## 使用技術
| 言語・フレームワーク  | バージョン |
| --------------------- | ---------- |
| ruby                  | 3.2.0      |
| rails                 | 7.0.0      |
| MySQL                 | 14.14      |

## サービスのURL
### デプロイ停止中
https://disease-log.onrender.com/<br/>

## サービスの概要・開発した背景
私はこれまで看護師として働いてきました。医療現場でコミュニケーションを取る中で、全員が当たり前のように会話ができないことを知りました。<br/>
開発の背景には、表現の難しい患者さんの症状を的確に伝えることで、適切な治療を受けられるようにしたいという思いがあります。<br/>
DiseaseLogは、声を発することができない人や症状の強さをうまく表現しにくい人が、5段階の表情の絵を使って症状を記録できるアプリです。<br/>
簡単に日々の症状を記録し、医療従事者とのコミュニケーションをサポートします。<br/>
さらに、近くの病院を探す機能も搭載しており、病院に行った際にはアプリに記録された症状を医師に見せることができます。<br/>

## 実際のアプリケーション画面
### TOP画面
病気管理アプリでありつつ、使用時に癒されるようにかわいい動物でお出迎えしております。<br/>
![スクリーンショット 2024-06-19 12 45 47](https://github.com/chiaki-taro/disease-log/assets/142806100/04bf9d17-a884-4762-9b10-b03145793371)

### 患者さん一覧画面
自分の身の回りの人など、管理している人を一覧で見ることができます。<br/>
![スクリーンショット 2024-06-19 12 47 04](https://github.com/chiaki-taro/disease-log/assets/142806100/ae3d0d4b-9013-411d-a528-0c7c88206ff3)

### 症状登録画面
声を発することができない人や症状の強さをうまく表現しにくい人が、5段階の表情の絵を使って症状を記録することができます。<br/>
数字で症状の強さを管理することで、症状のゴールを明確にしやすくできます。<br/>
数字で症状の強さを管理することのもう１つのメリットとして、個々の患者さんの痛みを共通して認識することができるようになることが挙げられます。<br/>
![スクリーンショット 2024-06-19 13 20 23](https://github.com/chiaki-taro/disease-log/assets/142806100/e3b3691d-16e9-48a4-8491-76fb44fede27)

### 症状一覧画面
症状を時系列でみることができます。<br/>
どのくらいの時間で薬の効果を得られたのか、薬の効果がないのかなど振り返り、通院時が必要となった際は医師に詳細を伝えやすくなっています。
![スクリーンショット 2024-06-19 12 48 16](https://github.com/chiaki-taro/disease-log/assets/142806100/90690741-d336-4009-8802-a1a417a8d07c)

### 病院を探すMap
現在地を取得し、近くの病院を探すことができます。

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
