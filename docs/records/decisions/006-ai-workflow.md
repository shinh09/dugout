# 006. AI 개발 체계

- 결정: Claude Code 오케스트레이터 + 서브에이전트 5개(backend·frontend·streaming·qa·docs), Gemini 교차 리뷰, 사람은 최종 머지
- 하네스: 루트 CLAUDE.md + 경로별 rules 7개, commands 3개, 직접 만든 스킬 7개 + 오픈소스 스킬, hooks 4개(세션 시작·포맷·차단·테스트 강제)
- 추가 적용: OpenAPI 기반 클라이언트 생성, qa가 실패 테스트를 먼저 쓰는 AI 간 TDD, AI 활용 지표 집계
- 차별점: 하네스 ON/OFF A/B 실험과 harness-changelog로 효과를 수치로 증명
- 역할 분담: Cowork = 설계·문서·블로그 / Claude Code = 개발·git
