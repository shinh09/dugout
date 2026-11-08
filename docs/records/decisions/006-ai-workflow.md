# 006. AI 개발 체계

- 결정: Claude Code 오케스트레이터 + 서브에이전트 5개(backend·frontend·streaming·qa·docs), Gemini 교차 리뷰, 사람은 최종 머지
- 하네스: 루트 CLAUDE.md + 경로별 rules 7개, commands 3개, 직접 만든 스킬 7개 + 오픈소스 스킬, hooks 4개(세션 시작·포맷·차단·테스트 강제)
- 추가 적용: OpenAPI 기반 클라이언트 생성, qa가 실패 테스트를 먼저 쓰는 AI 간 TDD, AI 활용 지표 집계
- 차별점: 하네스 ON/OFF A/B 실험과 harness-changelog로 효과를 수치로 증명
- 역할 분담: Cowork = 설계·문서·블로그 / Claude Code = 개발·git

## 오픈소스 스킬 (이슈 #9 기준)

| 스킬 | 출처 | 용도 | 사용 에이전트 |
| --- | --- | --- | --- |
| test-driven-development, systematic-debugging | obra/superpowers (이 2개만, 묶음 전체 설치 안 함) | TDD, 막혔을 때 원인 좁히기 | 오케스트레이터, qa, streaming |
| frontend-design | anthropics/skills | 화면 디자인 품질 | frontend |

- 내장 `/security-review`는 설치 없이 PR 전에 사용
- 설치 전에 SKILL.md와 포함된 스크립트를 읽고 확인, 출처 커밋·라이선스는 `.claude/skills/THIRD_PARTY.md`에 기록
- 변경(2026-11-09, #9): 처음 목록 8개 중 5개는 검토 후 제외. subagent-driven-development(승인·멈춤 규칙과 충돌), writing-plans(`/plan`과 중복), skill-creator(내장 스킬과 중복, 레포에 임시 파일 생성), webapp-testing(Python playwright 의존성, E2E는 JS Playwright), drawio(고정되지 않은 원격 지시문). 상세 이유는 THIRD_PARTY.md

## Gemini 교차 리뷰 (이슈 #8 기준)

정해진 것
- GitHub Actions에서 PR 열림·업데이트 시에만 실행, API 키는 Secrets `GEMINI_API_KEY`
- 리뷰 기준(프롬프트): 서버 소유자 권한 검사 누락, 방송 상태 전이(READY→LIVE→ENDED) 위반, 예외 처리, 비밀값 노출
- 리뷰는 **코드 줄 단위 댓글**(review thread)로 달려야 함 → 브랜치 보호 'Require conversation resolution'과 연결되고, Claude가 댓글마다 답글(반영 커밋 / 미반영 이유)
- 로컬 사전 점검은 `/review-local`(Gemini CLI)

/plan에서 정할 것
- 구현 방식: Google 공식 GitHub Action 사용 vs 직접 스크립트(diff → Gemini API → `gh api`로 리뷰 댓글) — 줄 단위 댓글 지원 여부로 판단
- 모델 이름은 레포 변수로 빼서 바꿀 수 있게
