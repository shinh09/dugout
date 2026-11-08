---
paths:
  - "apps/api/src/main/java/**/livekit/**"
  - "apps/web/src/streaming/**"
---

# 스트리밍 (LiveKit)

- 방송 상태는 서버(웹훅)가 바꾼다. 클라이언트가 상태를 직접 바꾸지 않는다
- 송출 토큰은 소유자에게만(publish), 시청 토큰은 구독 전용으로 발급한다
- 웹훅은 서명을 검증하고, 같은 이벤트가 다시 오면 무시한다
- 브라우저별 지원 차이(탭·시스템 소리, iOS Safari)는 확인 후 README의 지원 환경에 반영한다
