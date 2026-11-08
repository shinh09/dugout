# 외부 스킬 출처

커밋을 고정해 원본 그대로 복사했어요. 업데이트할 때는 아래 커밋과 비교해서 바뀐 부분을 읽고 확인한 뒤 다시 복사해요.

| 스킬 | 출처 (고정 커밋) | 원본 경로 | 라이선스 |
| --- | --- | --- | --- |
| test-driven-development | [obra/superpowers@22f0b46](https://github.com/obra/superpowers/tree/22f0b463e7a5e579904dd6211a520321035526f7) | `skills/test-driven-development` | MIT (`LICENSE`, 레포 루트에서 복사) |
| systematic-debugging | obra/superpowers@22f0b46 | `skills/systematic-debugging` | MIT (`LICENSE`, 레포 루트에서 복사) |
| frontend-design | [anthropics/skills@2c5958e](https://github.com/anthropics/skills/tree/2c5958ecac7cee2b583967a2c4981d0f4a75c579) | `skills/frontend-design` | Apache-2.0 (`LICENSE.txt`) |

## 알려진 제약

- systematic-debugging은 설치하지 않은 `superpowers:verification-before-completion`을 참조해요. 그 부분은 무시돼요
- test-driven-development의 "테스트 전에 쓴 코드는 지우고 다시"는 이 레포의 "대량 코드 삭제는 먼저 묻는다" 규칙이 우선해요

## 검토 후 제외한 스킬 (#9)

| 스킬 | 제외 이유 |
| --- | --- |
| subagent-driven-development | 모호함·한도 초과도 묻지 말고 스스로 결정하라는 지시가 승인 규칙·`/run-issues` 멈춤 조건과 충돌. 필요한 superpowers 스킬 4개도 없음 |
| writing-plans | `docs/superpowers/plans/`에 계획 저장·작업마다 커밋. 프로젝트 `/plan`과 겹침 |
| skill-creator | 레포 `.claude/commands/`에 임시 파일 생성, `claude -p` 다중 실행. 같은 스킬이 이미 내장돼 있음 |
| webapp-testing | Python playwright 새 의존성, 스크립트를 읽지 말고 실행하라는 지시. E2E는 qa 규칙대로 JS Playwright 사용 |
| drawio | 고정되지 않은 main 브랜치의 원격 마크다운을 받아 지시로 따름(프롬프트 인젝션 경로) |
