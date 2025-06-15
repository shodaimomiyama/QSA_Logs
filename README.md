# QSA_Logs

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

[思考フローのベース記事]

https://qiita.com/hann-solo/items/f95c5c7bca38cd628107
