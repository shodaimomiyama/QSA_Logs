# QSA_Logs

QSA (Question-Structure-Answer-Thought-Distillation) ログシステムは、構造化思考とナレッジマネジメントのためのツールです。Zettelkasten手法にインスパイアされた5段階の思考サイクルを提供します。

## 概要

QSAログは以下の5つのフェーズで構成される思考フレームワークです：

1. **Q (Question)** - 問い：探求したい中心的な疑問
2. **S (Structure)** - 構造：分析フレームワーク、論点、作業ステップ
3. **A (Answer)** - 応答：各構造要素に対する具体的な回答
4. **T (Thought)** - 思考：全体的な考察、洞察、次のアクション
5. **D (Distillation)** - 精製：核心的な知見、結論、将来の探求の種

## 使用方法

``` bash
# 基本形式
./QSA_Logs/create_qsa.sh "QSAログのタイトル" [オプション] [タグ...]

# オプション
--context <context_file>    # コンテキストファイルの指定（複数可）
--refs <ref_files>         # 参照ファイルの指定（複数可）
--status <status>          # ステータスの指定（draft/in-progress/completed/archived）
--target <target>          # 精製目標の指定（blog-post/note/idea等）

# 使用例
# 1. 最小限の形式
./QSA_Logs/create_qsa.sh "プロジェクト管理の最適化" QSA project-management

# 2. コンテキストと参照を含む形式
./QSA_Logs/create_qsa.sh "プロジェクト管理の最適化" \
  --context "KnowledgeManagement/Obsidian × LLMによる次世代ナレッジマネジメント.md" \
  --refs "QSA_Logs/workflow_guide.md" \
  QSA project-management

# 3. 完全な形式
./QSA_Logs/create_qsa.sh "プロジェクト管理の最適化" \
  --context "KnowledgeManagement/Obsidian × LLMによる次世代ナレッジマネジメント.md" \
  --refs "QSA_Logs/workflow_guide.md" \
  --status "in-progress" \
  --target "blog-post" \
  QSA project-management workflow-optimization
```

## ファイル構成

- `create_qsa.sh`: QSAログ生成スクリプト
- `template.md`: QSAログのベーステンプレート
- `workflow_guide.md`: QSA手法とAI協調パターンの詳細ガイド
- `README.md`: このファイル（使用方法とガイド）

## メタデータ構造

生成されるQSAログには以下のYAMLフロントマターが含まれます：

```yaml
---
title: "QSA: {質問タイトル}"
created: "{ISO形式のタイムスタンプ}"
tags: [QSA, Z-D, {カスタムタグ}...]
qsa_loop_id: "{ユニークID}"
status: "{ステータス}"
dependencies: []
next_qsa: []
---
```

## ワークフロー

詳細なワークフローについては `workflow_guide.md` を参照してください。AI協調パターンと各フェーズでの効果的な進め方が記載されています。

## ファイル命名規則

生成されるファイルは以下の形式で命名されます：
`YYYYMMDDHHMMSS_質問_要約.md`

例：`20241215143022_プロジェクト管理の最適化.md`

## 継続的改善

QSAシステムは使用体験に基づいて継続的に改善されます：

- 定期的なQSAログのレビュー
- ワークフローの最適化
- テンプレートの更新
- 自動化機能の拡張

## 関連リソース

[思考フローのベース記事]

https://qiita.com/hann-solo/items/f95c5c7bca38cd628107
