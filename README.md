# anime-google-calendar

今夜放送予定のアニメ番組一覧を取得し、Googleカレンダーに書き込んでくれるコード。

## セットアップ

参考資料: [https://qiita.com/kazama1209/items/a5817dee7ffc16327535](https://qiita.com/kazama1209/items/a5817dee7ffc16327535)

サービスアカウントの秘密鍵などの取得方法やLambdaへのデプロイ方法については↑を読んでください。

```
$ rbenv local 2.5.1
```

Rubyのバージョンを指定。（Lambdaで運用する事を想定した場合は2.5系もしくは2.7系を推奨。）

```
$ bundle install --path vendor/bundle
```

グローバルではなくローカル（「vendor/bundle」以下）にインストールすると後々扱いやすいです。

```
$ cp env.sample .env
```

「./.env」内に環境変数（GoogleカレンダーID）をセット。

```
$ ruby main.rb
```

実行。
