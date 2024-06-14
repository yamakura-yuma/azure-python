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

# docker_build_push_to_ghcrio

- requirement
  - gh
  - docker
  - GithubのSettings>Actions>GeneralでWorkflow permissionsにwrite権限を与えておく

- preparation
  - login with gh
    ```bash
    gh auth login
    ```
  - login with docker to ghcr.io
    ```bash
    echo $GITHUB_TOKEN_ACTIONS | docker login ghcr.io \
        -u $(curl -sS -H "Authorization: token $GITHUB_TOKEN_ACTIONS" https://api.github.com/user | jq -r .login) \
        --password-stdin
    ```
- actの実行
    ```bash
    act -j docker_build_push_ghcrio \
        -s GITHUB_TOKEN=$GITHUB_TOKEN_ACTIONS \
        --var GITHUB_USERNAME=$(curl -sS -H "Authorization: token $GITHUB_TOKEN_ACTIONS" https://api.github.com/user | jq -r .login) \
        --var REPOSITORY_NAME=$(gh repo view --json name -q '.name')
    ```
