Основано на статье [text](C)

backup базы:
```text
1 backup настроен в 2 ночи. его запускает скрипт из файла backup.sh. Сначала этот файл нужно было сделать 
  исполняемым chmod +x backup.sh 
  
  Ручная проверка исполняемости скрипта ./backup.sh

2 чтобы поставить на расписание backup.sh:
  crontab -e
  0 2 * * * /bin/bash /infrastructure_for_data_engineer_postrges/backup.sh >> /var/log/pg_backup.log 2>&1
  

3 Восстанавливаем из backup:
Тут идет распаковка из архива и восстанволение
gunzip -c pg_backups/db_20260301_190347.sql.gz | docker exec -i postgres_container psql -U postgres_user -d postgres_db

Где pg_backups/db_20260301_190347.sql.gz - файл бэкапа


