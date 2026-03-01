#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="./pg_backups"
docker exec -t postgres_container pg_dump -U postgres_user  postgres_db| gzip > "$BACKUP_DIR/db_$TIMESTAMP.sql.gz"
# Удаление бэкапов старше 7 дней
find $BACKUP_DIR -type f -mtime +7 -delete