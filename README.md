# アプリ名：TripRecord

## サイト概要
URL：http://35.74.218.154/(停止中)
![TripRecord（TOP）](https://user-images.githubusercontent.com/80659433/132176947-949cc456-244b-4daa-b5f4-8592f0bfc6c7.PNG)

- Trips ： 旅行を管理できます。旅行期間やコメント、訪れたスポットを登録できます。
- Calendar ： Tripを保存すると旅行をカレンダーで確認できます。
- SpotsMap ： 各Tripに保存されたスポットが地図上で確認できます。
- NextPlan ： 今後行きたいスポットを管理できます。詳細のURLを保存できます。

### サイト概要
過去の旅行や今後の行きたいスポットを管理するツールです。
地図やカレンダーで確認できたり、タグやお気に入り登録、検索機能で、もう一度行きたいスポットを絞り込みも可能です。

### 制作背景
旅行を行った際の個人での記録をするツールがあれば便利だと感じたため。
旅行の記録だけでなく、旅行中に訪れたスポットの記録や写真整理もすっきりまとめたいと考え、制作しました。

### 機能・実装一覧
- Spot検索機能
- お気に入り登録
- Spotのマッピング機能（Google API）
- タグ付け機能
- URLからWebサイトの情報をスクレイピングし、Webサイトの画像を取得し保存する機能

## 設計書
[ER図](https://app.diagrams.net/#G1ylomhG7nYx_e5KG0CbclFeb5HNxgQprr) / [テーブル定義書](https://docs.google.com/spreadsheets/d/1hLuMdZnioaDslFLZJwX5MK94ertT4vPqRXTjF74PeeY/edit#gid=627259186) / [詳細設計書](https://docs.google.com/spreadsheets/d/1-MZMoY2JMaQKvRG5hZco7MXmpdh6HCVmLuvve5PP7Kk/edit#gid=0)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- CSSフレームワーク：bootstrap 5.1.0
- IDE：Cloud9
- デプロイ：AWS EC2

