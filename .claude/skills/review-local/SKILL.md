---
name: review-local
description: PR 올리기 전 현재 변경을 Gemini로 빠르게 교차 리뷰받을 때 사용
---

# 로컬 교차 리뷰

1. 변경 내용을 모은다: `git diff main...HEAD`
2. Gemini CLI에 리뷰를 요청한다:
   `git diff main...HEAD | gemini -p "다음 diff를 리뷰해 줘. 기준: 서버 소유자 권한 검사 누락, 방송 상태 전이(READY→LIVE→ENDED) 위반, 예외 처리, 비밀값 노출. 문제마다 파일:줄, 심각도, 수정 제안을 짧게."`
3. 지적을 반영할지 판단해 반영하고, 반영하지 않은 것은 이유를 남긴다
4. 반복된 지적은 규칙 후보로 보고한다(`harness-changelog.md`)
