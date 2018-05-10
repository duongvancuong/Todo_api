#!/bin/bash
# wait-for-db.sh
# waits untils (but no longer than 60s) MySQL database is reachable under specific host

apt-get install netcat -y

i=0

echo "Checking database connection..."

unitil nc -z -v -w30 $DB_HOST 5432
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5

  ((++i))
  if [ $i -gt 2]; then
    echo "ERROR: Database is not running!"
    break
  fi
done
