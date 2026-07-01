# CI ガイド

テンプレートからプロジェクトを作成した後に参照し、セットアップ完了後は削除してよい。

## 基本方針

ローカルとリモートで同じチェックを走らせる。`just ci-local` が通ればリモート CI も通る状態を保つ。

## ローカル CI

`just ci-local` がローカル CI のエントリポイントである。pre-push フックから自動的に呼ばれるため、push する前にリモート CI と同等のチェックが走る。

```
pre-push → just ci-local → lint, test, build, ...
```

### アプリ毎の並列実行

モノレポで複数アプリがある場合、各アプリの CI レシピを並列で実行する。

```just
ci-local: check-agents-sync
    just be-ci & just fe-ci & wait
```

## リモート CI（GitHub Actions）

### ジョブ構成

ジョブはアプリ毎に分離する。互いに依存しないため並列実行でき、片方が壊れてももう片方の結果がすぐわかる。

| ジョブ | 目的 |
|---|---|
| `repo-checks` | AGENTS.md 同期チェック等、リポジトリ横断の整合性確認 |
| `{app}-ci` | アプリ毎の lint → 型検査 → テスト → ビルド |

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

CLAUDE.md と AGENTS.md は同一内容を維持する。`check-agents-sync` レシピおよび `repo-checks` ジョブで `diff -q` により検出する。

```just
check-agents-sync:
    @diff -q CLAUDE.md AGENTS.md >/dev/null || { echo "CLAUDE.md and AGENTS.md are out of sync. Run: cp CLAUDE.md AGENTS.md"; exit 1; }
```

## pre-commit フック

pre-commit ではアプリ毎に変更スコープを絞り、関連するチェックだけを実行する。

```bash
#!/usr/bin/env bash
set -euo pipefail

if git diff --cached --name-only | grep -q "^apps/backend/"; then
  just _be-lint
fi

if git diff --cached --name-only | grep -q "^apps/frontend/"; then
  just _fe-lint
fi
```
