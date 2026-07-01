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

### check / fix パターン

アプリ毎に `{app}-check` と `{app}-fix` の2レシピを用意する。lint とフォーマットのツールが分離しているか一体型かはアプリによって異なるが、この2レシピで吸収し、開発者がツールの違いを意識しなくて済むようにする。

- `check` — lint + フォーマットチェック + 型検査等を実行する。ファイルを書き換えない。CI と pre-commit で使用する。
- `fix` — 自動修正可能な処理をすべて実行する。lint の autofix とフォーマットの適用を含む。

```just
# Biome (lint + format が一体型) の場合
[private]
_back-check:
    cd apps/backend && bunx biome check .

[private]
_back-fix:
    cd apps/backend && bunx biome check --write .

# Dart (lint と format が分離型) の場合
[private]
_front-check:
    cd apps/android && flutter analyze
    cd apps/android && dart run custom_lint
    cd apps/android && dart format --set-exit-if-changed lib/ test/

[private]
_front-fix:
    cd apps/android && dart fix --apply
    cd apps/android && dart format lib/ test/
```

### 内部レシピ

外部に公開しないレシピには `[private]` アトリビュートを付け、名前を `_` で始める。`just --list` に表示されなくなる。

### 命名規則

モノレポでアプリが複数ある場合、`{app}-{action}` の形式でレシピを命名する。

```just
[group('Backend')]
back-ci:
back-test:
back-up:

[group('Frontend')]
front-ci:
front-test:
front-dev:
```

### 引数

レシピに引数を持たせる場合、デフォルト値を設定する。引数が複雑になる場合はレシピを分割する。

```just
# Build APK
front-build profile="debug":
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
