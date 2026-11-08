# Git

- 브랜치: `<type>/<이슈번호>-<설명>` (예: `feat/12-broadcast-update`). `#`는 쓰지 않는다
- 작업 커밋: Conventional Commits (`feat:`, `fix:`, `test:`, `refactor:`, `docs:`, `chore:`, `infra:`), 본문 한글 가능
- 이슈 제목: `[FEAT] 제목` / `[BUG] 제목` / `[TASK] 제목`. PR 제목은 연결된 이슈 제목과 똑같이 쓴다
- 테스트가 통과하는 논리 단위마다 작게 커밋한다
- main에 직접 push하거나 force push하지 않는다
- PR 본문은 `.github/pull_request_template.md`의 모든 섹션을 글자 수 제한 안에서 채운다
- PR 하나는 변경 파일 10개 / 400줄 이하. 넘으면 나눈다
- Gemini 리뷰 댓글에는 하나씩 답글(반영 커밋 링크 또는 미반영 이유)을 달고, 마지막에 요약 댓글 1개를 단다
