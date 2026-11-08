# 덕아웃 (Dugout)

야구 팬 스트리머 라이브 방송 플랫폼. 실시간 방송 플랫폼 개발 공모전 제출작 (마감 2026-11-19 23:59).

## 구조

- `apps/api` — Spring Boot 3 / Java 21 / PostgreSQL / JPA / Spring Security(JWT) / STOMP
- `apps/web` — React + Vite + TypeScript / React Query / LiveKit React
- `infra` — EC2 docker-compose, Nginx (사용자 담당)
- `docs/design` — 구현 기준 문서: [screens](docs/design/screens.md), [api](docs/design/api.md), [policy](docs/design/policy.md)
- `docs/test`, `docs/records` — 검증 결과, AI 활용·의사결정 기록

스트리밍은 LiveKit Cloud. 서버는 토큰 발급과 웹훅 처리만, 녹화는 Egress → S3.

## 명령어

- 백엔드: `cd apps/api && ./gradlew test` / `./gradlew bootRun --args='--spring.profiles.active=local'`
- 프론트: `cd apps/web && npm test` / `npm run dev`
- API 클라이언트 재생성: `/api-sync`
- 로컬 DB: `docker compose -f infra/docker-compose.local.yml up -d`

## 작업 방식

- 작업 단위는 GitHub 이슈 1개 = PR 1개. `/start-task` → `/plan` → 구현 → `/security-review` → `/ship`
- 규칙은 `.claude/rules/`에 있고, 작업 경로에 맞는 규칙이 자동으로 적용돼요
- 에이전트별 담당 폴더는 `.claude/agents/`의 설명을 따라요
- main 머지는 사람이 해요
