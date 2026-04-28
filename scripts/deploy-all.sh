#!/bin/zsh

echo "🚀 Obsidian 동기화 및 정적 사이트 배포를 시작합니다..."

# ==========================================
# 1. Quartz Blog 배포
# ==========================================
echo "\n[1/2] Quartz Blog 동기화 및 빌드 중..."

# exclude를 추가하여 99-attachment 폴더는 삭제 대상에서 제외합니다.
cp -r /home/junbeom/obsidian-vault/01-blog/. /opt/stacks/quartz-blog/content/
cp -r /home/junbeom/obsidian-vault/99-attachment/ /opt/stacks/quartz-blog/content/
cd /opt/stacks/obsidian-blog
docker compose up -d --build

# ==========================================
# 2. Docusaurus Docs 배포
# ==========================================
echo "\n[2/2] Docusaurus Docs 동기화 및 빌드 중..."

# 마찬가지로 exclude를 추가합니다.
cp -r /home/junbeom/obsidian-vault/02-docs/. /opt/stacks/docusaurus/docs/
cp -r /home/junbeom/obsidian-vault/99-attachment/ /opt/stacks/docusaurus/docs/
cd /opt/stacks/docusaurus-docs
docker compose up -d --build

echo "\n✅ 모든 배포가 완료되었습니다!"
