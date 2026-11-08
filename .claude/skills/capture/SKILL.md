---
name: capture
description: 블로그 재료로 화면을 캡처하고 메모를 남길 때 사용. PR 생성 직후나 트러블슈팅 해결 직후에도 사용
---

# 블로그 재료 캡처

저장 위치: `.blog/YYYY-MM-DD/` (Git 제외)

1. 웹 화면: Playwright(webapp-testing 스킬)로 대상 URL을 1440x900으로 캡처한다
2. 터미널·에디터·전체 화면: `screencapture -x .blog/<날짜>/<이름>.png` (macOS 화면 기록 권한 필요)
3. `.blog/notes.md`에 한 줄 추가: `- [날짜] [글 번호 1~5] <파일> — <한 줄 설명> (<관련 PR/이슈 링크>)`
4. 로그·에러·수치는 이미지 대신 원문과 링크를 notes.md에 붙인다
5. 캡처에 이메일·토큰이 보이면 notes.md에 '마스킹 필요'라고 표시한다
