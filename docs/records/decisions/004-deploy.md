# 004. 배포: Vercel + AWS

- 결정: 프론트 Vercel / 백엔드 EC2 + Docker Compose + Nginx(HTTPS, WebSocket 프록시) + RDS PostgreSQL / 이미지 ECR / CI·CD GitHub Actions
- 이유: AWS 인프라 직접 학습이 목적. 비즈니스 로직은 AI, 인프라는 사용자가 구축
- 환경: local / prod 2개, 스테이징 없음. 무료(저가) 도메인 + Let's Encrypt
- 버린 대안: Elastic Beanstalk(학습 효과 낮음), ECS Fargate + ALB(일정·비용 대비 과함)
