---
name: ship
description: 구현을 마친 브랜치를 커밋·push하고 템플릿에 맞춘 PR을 만들 때 사용
---

# PR 만들기

1. 확인: 테스트 통과, `/security-review` 완료, 변경 파일 10개·400줄 이하 (넘으면 멈추고 나누자고 제안)
2. 남은 변경을 Conventional Commits로 커밋하고 `git push -u origin HEAD` (main이면 중단)
3. 이슈 제목을 그대로 PR 제목으로 쓴다: `gh issue view <번호> --json title`
4. `.github/pull_request_template.md` 섹션을 글자 수 제한 안에서 채워 `gh pr create`
   - 한 줄 요약(50자) + `Closes #<번호>`, 왜(100자), 무엇을 바꿨나(최대 5개), 판단이 필요한 부분(최대 3개), 확인 방법, 체크리스트
5. `/capture`로 PR 페이지를 캡처해 블로그 재료로 남긴다
6. PR 링크를 보고하고, Gemini 리뷰가 달리면 댓글마다 답글(반영 커밋 / 미반영 이유) + 요약 댓글 1개
