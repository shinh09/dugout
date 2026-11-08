---
name: docs-update
description: 마일스톤마다 README·docs를 갱신하고 AI 활용 지표를 집계할 때 사용
---

# 문서 갱신

1. README 필수 항목 점검: 서비스 주소, 테스트 계정·로그인 방법, 실행 방법·환경변수, PC·모바일 송출·시청·종료 확인 절차, 지원 환경
2. `docs/test/requirements.md`: 요구사항별 구현 내용과 코드 위치 갱신
3. AI 지표 집계(`gh api`): PR 수(라벨별), PR별 Gemini 리뷰 댓글 수와 답글 수, 사람 커밋 비율, CI 재실행 수 → `docs/records/ai-workflow.md` 표 갱신
4. 구성도·ERD가 바뀌었으면 draw.io 스킬로 다시 그린다
5. 오픈소스 출처·라이선스 목록 갱신
