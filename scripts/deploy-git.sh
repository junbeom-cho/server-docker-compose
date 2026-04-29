#!/bin/zsh

echo "Quartz 및 Docusaurus git 배포 시작..."

# ==========================================
# Quartz Blog 배포
# ==========================================
echo "\n[1/2] Quartz Blog 동기화 및 빌드 중..."
cd /opt/stacks/quartz-blog
git pull origin v4
cd /opt/stacks/obsidian-blog
docker compose up -d --build

# ==========================================
# Docusaurus Docs 배포
# ==========================================
echo "\n[2/2] Docusaurus Docs 동기화 및 빌드 중..."
cd /opt/stacks/docusaurus
git pull origin main
cd /opt/stacks/docusaurus-docs
docker compose up -d --build

echo "\n✅ 모든 배포가 완료되었습니다!"

