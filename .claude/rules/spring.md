---
paths:
  - "apps/api/**"
---

# Spring 백엔드

- 도메인 패키지(`auth`, `broadcast`, `chat`, `vod`, `category`, `livekit`, `common`) 안에서 controller → service → repository
- 엔티티를 응답으로 반환하지 않는다. 목록용·상세용 DTO를 나눈다
- 권한·상태 검사는 service에서 하고, 위반 시 정해진 에러 코드(401/403/409)로 응답한다
- 목록 조회는 fetch join 등으로 N+1을 막는다
- 예외는 `common`의 전역 핸들러에서 `{code, message}` 형식으로 응답한다
- 입력 검증 규칙은 `docs/design/policy.md`를 따른다
