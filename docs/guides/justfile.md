# justfile ガイド

テンプレートからプロジェクトを作成した後に参照し、セットアップ完了後は削除してよい。

## just とは

just はコマンドランナーである。Make と異なりファイルの依存グラフ解決を行わず、タスクの実行に特化している。

### 採用理由

- `just --list` でレシピ一覧・グループ分け・引数表示が組み込みで得られるため、ヘルプ生成の自作が不要。
- `[private]`・`[group]` 等のアトリビュートで表示制御を宣言的に記述できる。
- Makefile と書き味が近く、学習コストが低い。

## justfile の規約

### グループ

`[group]` アトリビュートでレシピをセクション分けする。`just --list` の出力に反映される。

```just
# Start development servers
[group('Development')]
dev:
    bun run dev
```

### 内部レシピ

外部に公開しないレシピには `[private]` アトリビュートを付け、名前を `_` で始める。`just --list` に表示されなくなる。

```just
[private]
_lint-backend:
    cd apps/backend && bunx biome check .
```

### 命名規則

モノレポでアプリが複数ある場合、`{app}-{action}` の形式でレシピを命名する。

```just
[group('Backend')]
be-ci:
be-test:
be-up:

[group('Frontend')]
fe-ci:
fe-test:
fe-dev:
```

### 引数

レシピに引数を持たせる場合、デフォルト値を設定する。引数が複雑になる場合はレシピを分割する。

```just
# Build APK
fl-build profile="debug":
    cd apps/android && flutter build apk --{{ profile }}
```

## CI 環境での導入

### GitHub Actions

```yaml
- uses: extractions/setup-just@v2
- run: just ci-local
```

### Cloudflare Workers Builds

```toml
[build]
command = "curl -sSf https://just.systems/install.sh | bash -s -- --to ./bin && PATH=$PWD/bin:$PATH just build"
```
