# README

## 開発環境のセットアップ
1. `/etc/hosts`に下記の行を追加する。
```
127.0.0.1 my-project.test my_project-admin.test
```

2. Railsサーバーを立ち上げる
```
rails s
```

3. アクセスする
  * ユーザー側
    * [http://my-project.test:3000](http://my-project.test:3000)
  * 管理画面側
    * [http://my-project-admin.test:3000](http://my-project-admin.test:3000)

## このリポジトリはなんなのか？
* 開発したいと思った機能をどんどん載せていくプロジェクト

## バージョン
* Ruby 3.1.0
* Rails 7.0.2.2
