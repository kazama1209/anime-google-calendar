# anime-google-calendar

![68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3638383835342f66373239303562342d333431382d326135612d666561372d6532373732396162386335622e6a706567](https://user-images.githubusercontent.com/51913879/114591438-d706c400-9cc4-11eb-9bdc-5ad4a969f0d3.jpeg)


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
