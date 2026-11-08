---
description: 단계별 진행률, 남은 일수, PR·CI 상태 요약
---

GitHub 상태를 `gh`로 확인해서 아래 형식으로 짧게 요약해 줘.

1. 단계별 진행률: 상위 이슈의 하위 이슈 기준
   - #1 [진행] 필수 기능 / #2 [진행] 선택 기능 / #3 [진행] 제출 준비
   - `gh api repos/{owner}/{repo}/issues/<번호> --jq .sub_issues_summary` 로 완료 수 / 전체 수와 % 를 구해
   - 하위 이슈 목록이 필요하면 `gh api repos/{owner}/{repo}/issues/<번호>/sub_issues`
2. 마감(2026-11-19 23:59 KST)까지 남은 일수와, 지금 속도로 필수 단계를 끝낼 수 있는지 한 줄 판단
3. 열린 PR: 제목, CI 상태, 답하지 않은 리뷰 댓글 수
4. 막힌 이슈: 영역 라벨(backend·frontend·streaming·qa·docs)과 막힌 이유
5. 오늘 추천 작업 3개 (#1 하위 이슈 우선)

판단 기준: 11/14까지 #1이 100%가 아니면 #2 범위를 줄이자고 제안해.
