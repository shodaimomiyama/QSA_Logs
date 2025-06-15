#!/bin/bash

# 引数のチェック
if [ $# -lt 1 ]; then
    echo "Usage: $0 <question_summary> [--context <context_file>] [--refs <ref_files>] [tags...]"
    echo "Example: $0 'プロジェクトの要件定義' --context context.md --refs ref1.md ref2.md project requirements"
    exit 1
fi

# 変数の初期化
QUESTION="$1"
CONTEXT_FILE=""
REF_FILES=()
TAGS=()
shift

# 引数の解析
while [ $# -gt 0 ]; do
    case "$1" in
        --context)
            CONTEXT_FILE="$2"
            shift 2
            ;;
        --refs)
            shift
            while [ $# -gt 0 ] && [[ ! "$1" =~ ^-- ]]; do
                REF_FILES+=("$1")
                shift
            done
            ;;
        *)
            TAGS+=("$1")
            shift
            ;;
    esac
done

# タイムスタンプの生成
TIMESTAMP=$(date "+%Y%m%d%H%M%S")
DATE_ISO=$(date "+%Y-%m-%dT%H:%M:%S")

# ファイル名の生成（スペースをアンダースコアに変換）
FILENAME="${TIMESTAMP}_$(echo "$QUESTION" | tr ' ' '_' | tr '[:upper:]' '[:lower:]').md"

# タグの処理
TAGS_STR="[QSA, Z-D"
if [ ${#TAGS[@]} -gt 0 ]; then
    for tag in "${TAGS[@]}"; do
        TAGS_STR="${TAGS_STR}, ${tag}"
    done
fi
TAGS_STR="${TAGS_STR}]"

# コンテキストの読み込み
CONTEXT_CONTENT=""
if [ -n "$CONTEXT_FILE" ] && [ -f "$CONTEXT_FILE" ]; then
    CONTEXT_CONTENT=$(cat "$CONTEXT_FILE")
fi

# 参照ファイルの処理
REFS_CONTENT=""
if [ ${#REF_FILES[@]} -gt 0 ]; then
    for ref in "${REF_FILES[@]}"; do
        if [ -f "$ref" ]; then
            REFS_CONTENT="${REFS_CONTENT}- [[${ref}]]\n"
        fi
    done
fi

# テンプレートの内容を生成
cat > "QSA_Logs/${FILENAME}" << EOF
---
title: "QSA: ${QUESTION}"
created: "${DATE_ISO}"
tags: ${TAGS_STR}
qsa_loop_id: "${TIMESTAMP}"
status: "in-progress"
dependencies: []
next_qsa: []
---

## Context
<!-- このQSAを開始した背景、きっかけ、関連情報 -->
${CONTEXT_CONTENT}

## References
<!-- 関連メモ・リンク -->
${REFS_CONTENT}

## Thinking Log

### Q (Question) - 問い
<!-- このサイクルで明確にしたい中心的な問い -->
- 

### S (Structure) - 構造
<!-- 問いに答えるための論点、分析の軸、比較項目、作業ステップなど -->
- 1. 
- 2. 
- 3. 

### A (Answer) - 応答
<!-- Sの各項目に対する具体的な記述、調査結果、LLMによる生成と人間による編集 -->

#### 1. 
- 

#### 2. 
- 

#### 3. 
- 

### T (Thought) - 思考 / 内省
<!-- A全体を受けての考察、発見、疑問点、次のアクション、このQSAの評価 -->
- 

## D (Distillation) - 精製
<!-- このQSAサイクルから抽出された核心的な知見、結論、Zettelの種、アウトプットの原型 -->
- 
EOF

echo "Created new QSA log: QSA_Logs/${FILENAME}" 
