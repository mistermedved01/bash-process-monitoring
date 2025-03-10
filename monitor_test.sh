#!/bin/bash

LOG_FILE="/var/log/monitoring.log"

MONITORING_URL="https://test.com/monitoring/test/api"

PROCESS_NAME="test"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

if pgrep -x "$PROCESS_NAME" > /dev/null; then
    if curl -s --head --request GET "$MONITORING_URL" | grep "200 OK" > /dev/null; then
        log_message "Процесс $PROCESS_NAME запущен. Сервер мониторинга доступен."
    else
        log_message "Процесс $PROCESS_NAME запущен, но сервер мониторинга недоступен."
    fi
else
    if [ -f /tmp/${PROCESS_NAME}_was_running ]; then
        log_message "Процесс $PROCESS_NAME был перезапущен."
        rm /tmp/${PROCESS_NAME}_was_running
    fi
fi
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    touch /tmp/${PROCESS_NAME}_was_running
fi
