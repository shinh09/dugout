#!/usr/bin/env bash
# SessionStart: 현재 브랜치에 연결된 이슈를 컨텍스트로 불러옴 (stdout이 Claude 컨텍스트에 추가됨)
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
cd "$root" || exit 0
branch="$(git branch --show-current 2>/dev/null)"
echo "현재 브랜치: ${branch:-알 수 없음}"
num="$(echo "$branch" | sed -nE 's#^[a-z]+/([0-9]+)-.*#\1#p')"
if [ -n "$num" ] && command -v gh >/dev/null 2>&1; then
  echo "연결된 이슈 #$num:"
  gh issue view "$num" --json title,body,labels --template '{{.title}}{{"\n"}}{{range .labels}}[{{.name}}] {{end}}{{"\n\n"}}{{.body}}' 2>/dev/null | head -n 60
else
  echo "연결된 이슈 없음. 새 작업이면 /start-task 로 시작하세요."
fi
exit 0
