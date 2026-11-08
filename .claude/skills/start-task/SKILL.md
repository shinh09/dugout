---
name: start-task
description: 이슈를 만들거나 고르고, 규칙에 맞는 브랜치를 만들어 작업을 시작할 때 사용
---

# 작업 시작

1. 인자로 이슈 번호가 오면 `gh issue view <번호>`로 읽는다. 내용이 오면 템플릿(`.github/ISSUE_TEMPLATE`)에 맞춰 `gh issue create`로 만든다
   - 제목: `[FEAT] …` / `[BUG] …` / `[TASK] …`
   - 라벨: 종류(`feature` / `bug` / `task`) + 영역(`backend` / `frontend` / `streaming` / `qa` / `docs`)
   - 단계는 라벨 대신 상위 이슈로 정한다: #1 필수 기능 / #2 선택 기능 / #3 제출 준비
   - 하위 이슈로 연결: `gh api repos/{owner}/{repo}/issues/<상위번호>/sub_issues -F sub_issue_id=$(gh api repos/{owner}/{repo}/issues/<새 이슈 번호> --jq .id)`
2. main을 최신으로 받는다: `git switch main && git pull`
3. 브랜치를 만든다: `git switch -c <type>/<번호>-<짧은-설명>` (type: feat, fix, task)
4. 이슈를 본인에게 할당한다: `gh issue edit <번호> --add-assignee @me`
5. 이슈의 근거 문서를 읽고 `/plan <번호>`로 넘어간다
