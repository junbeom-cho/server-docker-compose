#!/bin/zsh
# Quartz 및 Docusaurus 자동 배포 스크립트

QUARTZ_DIR="/opt/stacks/quartz-blog/"
DOCUSAURUS_DIR="/opt/stacks/docusaurus/"
LOG_FILE="/opt/stacks/scripts/log/deploy-auto.log"

echo "$(date): 자동 배포 스크립트 실행" >> $LOG_FILE

# =======================================================
# Quartz 블로그 자동 배포
# =======================================================
cd QUARTZ_DIR || exit
git fetch origin
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/v4)
if [ $LOCAL != $REMOTE ];
then
    echo "$(date): Quartz 업데이트 감지 - 배포 시작" >> $LOG_FILE
    git reset --hard origin/v4
    cd /opt/stacks/obsidian-blog
    docker compose down
    docker compose up -d --build
    echo "$(date): Quartz 배포 완료" >> $LOG_FILE
else
    echo "$(date): Quartz 업데이트 없음" >> $LOG_FILE
fi

# =======================================================
# Docusaurus 자동 배포
# =======================================================
cd DOCUSAURUS_DIR || exit
git fetch origin
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)
if [ $LOCAL != $REMOTE ];
then
    echo "$(date): Docusaurus 업데이트 감지 - 배포 시작" >> $LOG_FILE
    git reset --hard origin/main
    cd /opt/stacks/docusaurus-docs
    docker compose down
    docker compose up -d --build
    echo "$(date): Docusaurus 배포 완료" >> $LOG_FILE
else
    echo "$(date): Docusaurus 업데이트 없음" >> $LOG_FILE
fi

echo "$(date): 자동 배포 스크립트 종료" >> $LOG_FILE