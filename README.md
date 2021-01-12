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

# APIの疎通確認

## ログイン

```
$ User.create!(name: 'テストユーザー', email: 'test-user+1@example.com', password: 'password')

$ curl -D - localhost:3200/auth/sign_in -X POST -d '{"email":"test-user+1@example.com", "password":"password"}' -H "content-type:application/json"
```

返り値として以下のような値が返れば成功

```
~いろいろ省略~
access-token: Tj4YqB40E0rK1fknfZQWDQ
token-type: Bearer
client: tJ4flO5ECHq114ti2Fe2Ww
expiry: 1611666216
uid: test-user+1@example.com
~いろいろ省略~

{"data":{"id":1,"email":"test-user+1@example.com","provider":"email","uid":"test-user+1@example.com","allow_password_change":false,"name":"テストユーザー","nickname":null,"image":null}}
```

## トークン検証

ログインAPIを叩いて返ってきたレスポンスヘッダー内のtoken類をリクエストヘッダーに載せてAPIを叩く

```
$ curl -D - -H "access-token:your-access-token" -H "client:ypur-client" -H "expiry:your-expiry" -H "uid:your-uid" -H "content-type:application/json" localhost:3200/auth/validate_token
```

返り値として以下のような値が返れば成功

```
~いろいろ省略~
access-token: Tj4YqB40E0rK1fknfZQWDQ
token-type: Bearer
client: tJ4flO5ECHq114ti2Fe2Ww
expiry: 1611666216
uid: test-user+1@example.com
~いろいろ省略~

{"success":true,"data":{"id":1,"provider":"email","uid":"test-user+1@example.com","allow_password_change":false,"name":"テストユーザー","nickname":null,"image":null,"email":"test-user+1@example.com"}}
```