# 003. 기술 스택과 모노레포

- 결정: 모노레포(`apps/api`, `apps/web`) / Spring Boot 4.0 + Java 21 / React + Vite + TypeScript / PostgreSQL / LiveKit Cloud
- 이유
  - 프론트·백 분리: 에이전트 담당 폴더 분리, 서버 인가 로직의 가시성, WebSocket 상시 서버
  - Spring: 사용자에게 익숙한 스택(문제 발생 시 직접 판단 가능)
  - LiveKit: 화면 공유·시스템 소리·모바일 카메라를 브라우저 WebRTC로 처리, 녹화(Egress) 제공
- API 원칙: 리소스 중심 REST + 용도별 응답 DTO, OpenAPI로 프론트 클라이언트 생성
- 버린 대안: Next.js 단일 풀스택, Flutter 앱(과제가 웹 서비스)
- 변경(2026-11-08, #4): Spring Boot 3 → 4.0.9. 3.x 공개 지원이 끝났고 start.spring.io가 4.x만 제공. springdoc 3.0.x, 테스트 DB는 Testcontainers(PostgreSQL)
