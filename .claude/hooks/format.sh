#!/usr/bin/env bash
# PostToolUse(Edit|Write|MultiEdit): 수정한 파일 자동 포맷. 실패해도 작업은 막지 않음
input="$(cat)"
file="$(python3 -c 'import json,sys; print((json.loads(sys.argv[1]).get("tool_input") or {}).get("file_path",""))' "$input" 2>/dev/null)"
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
[ -z "$file" ] && exit 0
case "$file" in
  *apps/api/*.java)
    if [ -x "$root/apps/api/gradlew" ]; then
      (cd "$root/apps/api" && ./gradlew -q spotlessApply >/dev/null 2>&1) || true
    fi ;;
  *apps/web/*.ts|*apps/web/*.tsx|*apps/web/*.css|*apps/web/*.json)
    if [ -d "$root/apps/web/node_modules" ]; then
      (cd "$root/apps/web" && npx --no-install prettier --write "$file" >/dev/null 2>&1; \
       case "$file" in *.ts|*.tsx) npx --no-install eslint --fix "$file" >/dev/null 2>&1;; esac) || true
    fi ;;
esac
exit 0
