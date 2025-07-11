#!/bin/bash

URLS=("https://google.com" "https://facebook.com" "https://twitter.com" "https://twwerwersaweitter.com")
LOG_FILE="website_status.log"

for URL in "${URLS[@]}"; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
  if [ "$HTTP_CODE" -eq 200 ]; then
    STATUS="UP"
  else
    STATUS="DOWN"
  fi
  # echo "[<$URL>](<$URL>) is $STATUS" >> "$LOG_FILE"
  echo "<$URL> is $STATUS" >> $LOG_FILE


done
echo "Результати записані у файл: $LOG_FILE"

