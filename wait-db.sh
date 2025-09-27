#!/bin/bash
until nc -z $DB_HOST $DB_PORT; do
  echo "Ожидание базы данных..."
  sleep 1
done
echo "База данных доступна!"
exec "$@"