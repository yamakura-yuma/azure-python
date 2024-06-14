# 他ページのリンク

[Project Root README.md](../README.md)

# How to Use: act

## `act`

- 実行できる一覧を取得

```bash
act --list # act -lでも可
```

- pushイベントとしてGithub Actionsのテスト

```bash
act
# 表示が少なくなる
act --quiet
# 環境変数やシークレットの指定
act --env-file hoge.env
act --secret SECRET_NAME=hoge
act --secret-file hoge.secrets
```

- PRイベントとしてGithub Actionsのテスト

```bash
act pull_request
```

- スケジュールイベントとしてGithub Actionsのテスト

```bash
act schedule
```
