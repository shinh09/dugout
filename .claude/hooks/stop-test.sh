#!/usr/bin/env bash
# Stop: 바뀐 앱의 테스트가 실패하면 종료를 막음(exit 2). 통과하면 블로그 재료 리마인드
input="$(cat)"
active="$(python3 -c 'import json,sys; print(json.loads(sys.argv[1]).get("stop_hook_active", False))' "$input" 2>/dev/null)"
[ "$active" = "True" ] && exit 0
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
cd "$root" || exit 0
changed="$(git status --porcelain 2>/dev/null; git diff --name-only main...HEAD 2>/dev/null)"

if echo "$changed" | grep -q "apps/api/" && [ -x apps/api/gradlew ]; then
  if ! (cd apps/api && ./gradlew -q test >/tmp/dugout-api-test.log 2>&1); then
    echo "[stop-test] 백엔드 테스트가 실패했어요. 고친 뒤 끝내 주세요. 로그 끝부분:" >&2
    tail -n 30 /tmp/dugout-api-test.log >&2
    exit 2
  fi
fi
if echo "$changed" | grep -q "apps/web/" && [ -d apps/web/node_modules ]; then
  if ! (cd apps/web && npm test --silent >/tmp/dugout-web-test.log 2>&1); then
    echo "[stop-test] 프론트 테스트가 실패했어요. 고친 뒤 끝내 주세요. 로그 끝부분:" >&2
    tail -n 30 /tmp/dugout-web-test.log >&2
    exit 2
  fi
fi

today="$(date +%Y-%m-%d)"
if [ -n "$changed" ] && ! grep -q "\[$today\]" .blog/notes.md 2>/dev/null; then
  echo '{"systemMessage": "오늘 블로그 재료가 아직 없어요. 남길 만한 화면이나 트러블슈팅이 있었다면 /capture 해 두세요."}'
fi
exit 0
