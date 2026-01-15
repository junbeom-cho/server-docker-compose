#!/bin/bash
set -e

# psql 명령어를 사용해 환경 변수가 포함된 SQL을 실행합니다.
# 변수명은 .env 파일에 정의된 이름과 일치해야 합니다.

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- 1. Authentik
    CREATE USER authentik_user WITH PASSWORD '${PG_AUTHENTIK_USER_PASSWORD}';
    CREATE DATABASE authentik_db OWNER authentik_user;
    GRANT ALL PRIVILEGES ON DATABASE authentik_db TO authentik_user;