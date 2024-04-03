#!/bin/bash

# Парольная фраза
export BORG_PASSPHRASE=Otus1234
# Репозиторий
REPO=borg@10.100.11.114:/var/backup/
# Что бэкапим
#BACKUP_TARGET=/etc

# Создание бэкапа с записью лога
borg create --stats $REPO::"etc-{now:%Y-%m-%d_%H:%M:%S}" /etc >> /var/log/borg/borg.log 2>&1                  \

# Проверка бэкапа
borg check $REPO

# Очистка старых бэкапов
borg prune --keep-daily 90 --keep-monthly 12 --keep-yearly 1 $REPO
