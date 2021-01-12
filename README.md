# README

Rails6 APIモード + devise_token_auth で認証機能付きのAPIを作成しました。

# 開発環境構築手順

```
$ git clone https://github.com/keisuke-koshikawa/sample-api

$ cd sample-api

$ docker-compose build

$ docker-compose run web rails db:create

$ docker-compose run web rails db:migrate

$ docker-compose run web rails db:seed

$ docker-compose up -d
```

# 開発中によく使うコマンド

```
# コンテナを停止したい時
$ docker-compose down

# Gemファイルを編集した時
$ docker-compose down

$ docker-compose build

$ docker-compose up -d

# コンテナの起動状況を確認したい時

$ docker-compose ps

# コンテナを強制的に削除したい時

$ docker rm -f container_id

# イメージを強制的に削除したい時

$ docker rmi -f image_id
```