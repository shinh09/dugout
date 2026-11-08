# 007. 진행 관리와 PR 운영

- 진행 관리: 날짜 마일스톤 대신 진행률. 라벨(stage·area·종류) + 상위 이슈 3개에 하위 이슈 연결
- Git: GitHub Flow, 브랜치 `<type>/<번호>-<설명>`, 이슈 제목 `[FEAT]/[BUG]/[TASK]`, PR 제목 = 이슈 제목, squash merge(커밋 제목 = PR 제목)
- PR 본문: 사람이 2분 안에 판단하는 문서(요약·왜·변경·판단 필요·확인 방법·체크리스트). 파일 10개·400줄 이하
- 리뷰: Gemini 리뷰 댓글마다 답글 + 요약 댓글, 'conversation resolution' 필수
- 1인 프로젝트라 required approvals는 끄고, 사람 승인 = 직접 머지
