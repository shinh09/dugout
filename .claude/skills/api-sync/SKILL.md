---
name: api-sync
description: 백엔드 API가 바뀐 뒤 OpenAPI 명세로 프론트 API 클라이언트를 다시 만들 때 사용
---

# API 클라이언트 동기화

1. 백엔드를 local 프로필로 실행하거나 실행 중인지 확인한다
2. 명세를 받는다: `curl -s http://localhost:8080/v3/api-docs -o apps/web/openapi.json`
3. 타입을 생성한다: `cd apps/web && npx openapi-typescript openapi.json -o src/api/generated/schema.ts`
4. 타입 검사: `npm run typecheck`. 깨진 화면 코드가 있으면 목록을 보고한다(직접 고치는 건 frontend 에이전트)
5. `src/api/generated`는 손으로 고치지 않는다
