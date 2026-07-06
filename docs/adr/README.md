# ADR (Architecture Decision Record)

このディレクトリには、プロジェクトの重要な設計判断を記録する。

## 目的

「何を選んだか」だけでなく「なぜそれを選んだか」を後から追跡できるようにする。一度書いたADRは基本的に書き換えず、判断が覆った場合は新しいADRを追加して古いものをsupersededとする。

## 命名規則

`YYYYMMDD-kebab-case-title.md`

- 日付は決定した日を表す
- タイトルは英小文字とハイフンのみで構成する

## フォーマット

Michael Nygardが提唱したADRの基本形式に従う。

- Status: proposed / accepted / superseded など
- Context: 何が問題で、どんな制約があったか
- Decision: 何を決定したか
- Consequences: その決定によって生じる影響（良い面・悪い面の両方）
