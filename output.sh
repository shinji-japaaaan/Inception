#!/bin/bash

# 出力先ファイル

outputFile="project_contents.txt"

# 自身のスクリプト名

scriptName=$(basename "$0")

# 古いファイルがあれば削除

[ -f "$outputFile" ] && rm "$outputFile"

# プロジェクト配下の非隠しファイルを取得して出力（隠しフォルダ・隠しファイル除外）

find . -type f ! -name ".*" ! -name "$scriptName" ! -path "./.*/*" | while read -r file; do
echo "===== $file =====" >> "$outputFile"
cat "$file" >> "$outputFile"
echo -e "\n\n" >> "$outputFile"
done

echo "出力完了: $outputFile"
