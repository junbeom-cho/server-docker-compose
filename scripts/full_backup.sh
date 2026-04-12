#!/bin/bash

BACKUP_DIR="/opt/data/postgresql"
CONTAINER_NAME="postgresql"

# 현재 시간 출력 (로그 확인용)
echo "==========================================="

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 백업 시작"

# 실행 (성공 시 성공 메시지, 실패 시 실패 메시지 출력)
if /usr/bin/docker exec -t $CONTAINER_NAME pg_dumpall -U postgres > "$BACKUP_DIR/full_backup_latest.sql.tmp"; then
    mv "$BACKUP_DIR/full_backup_latest.sql.tmp" "$BACKUP_DIR/full_backup_latest.sql"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 백업 성공: full_backup_latest.sql 생성됨"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 백업 실패: Docker 명령 실행 중 에러 발생"
    exit 1
fi

echo "==========================================="