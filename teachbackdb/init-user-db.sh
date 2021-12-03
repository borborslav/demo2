#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE lv646db;
    GRANT ALL PRIVILEGES ON DATABASE lv646db TO postgres;
