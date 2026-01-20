CREATE USER authentik_user WITH PASSWORD '${PG_AUTHENTIK_USER_PASSWORD}';

CREATE DATABASE authentik_db OWNER authentik_user;

GRANT ALL PRIVILEGES ON DATABASE authentik_db TO authentik_user;