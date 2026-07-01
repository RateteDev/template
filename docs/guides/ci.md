# CI ガイド

テンプレートからプロジェクトを作成した後に参照し、セットアップ完了後は削除してよい。

## 基本方針

CI はリモート（GitHub Actions）で実行する。pre-commit フックでコミット時の最低限の検査を担保し、push 後のリモート CI で全チェックを行う。

ローカルでは変更に関連するアプリの CI レシピ（`just back-ci` / `just front-ci` 等）を手動で実行し、push 前に確認する運用を推奨する。

## ローカル CI

`just ci-local` は全アプリの CI をまとめて並列実行するレシピである。変更範囲が広い場合や、push 前に全体の整合性を確認したい場合に使用する。

```just
ci-local:
    just _check-agents-sync
    just back-ci & just front-ci & wait
```

通常の開発では変更したアプリの CI レシピを個別に実行すれば十分である。

```sh
just back-ci    # バックエンドの変更後
just front-ci   # フロントエンドの変更後
```

## リモート CI（GitHub Actions）

### ジョブ構成

ジョブはアプリ毎に分離する。互いに依存しないため並列実行でき、片方が壊れてももう片方の結果がすぐわかる。

| ジョブ | 目的 |
|---|---|
| `repo-checks` | AGENTS.md 同期チェック等、リポジトリ横断の整合性確認 |
| `{app}-ci` | アプリ毎の check → テスト → ビルド |

### concurrency 制御

同一ブランチの CI が重複実行されないよう、`concurrency` を設定する。

```yaml
concurrency:
  group: ci-${{ github.ref }}
  cancel-in-progress: true
```

### キャッシュ戦略

lockfile のハッシュをキーにして依存パッケージをキャッシュする。

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.bun/install/cache
    key: bun-${{ runner.os }}-${{ hashFiles('apps/backend/bun.lock') }}
    restore-keys: bun-${{ runner.os }}-
```

## AGENTS.md 同期チェック

CLAUDE.md と AGENTS.md は同一内容を維持する。`_check-agents-sync` レシピおよび `repo-checks` ジョブで `diff -q` により検出する。

## pre-commit フック

pre-commit ではアプリ毎に変更スコープを絞り、関連するチェックだけを実行する。

```bash
#!/usr/bin/env bash
set -euo pipefail

if git diff --cached --name-only | grep -q "^apps/backend/"; then
  just back-check
fi

if git diff --cached --name-only | grep -q "^apps/frontend/"; then
  just front-check
fi
```
