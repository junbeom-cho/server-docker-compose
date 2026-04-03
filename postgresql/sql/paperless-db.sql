CREATE USER paperless_user WITH PASSWORD '${PG_PAPERLESS_USER_PASSWORD}';
CREATE DATABASE paperless_db OWNER paperless_user;
GRANT ALL PRIVILEGES ON DATABASE paperless_db TO paperless_user;