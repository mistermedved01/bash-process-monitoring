Создадим скрипт /usr/local/bin/monitor_test.sh
chmod +x /usr/local/bin/monitor_test.sh

Создадим systemd-юнит /etc/systemd/system/monitor_test.service

Для выполнения скрипта каждую минуту создадим systemd-таймер /etc/systemd/system/monitor_test.timer

Активируем и запустим таймер:
systemctl enable monitor_test.timer
systemctl start monitor_test.timer

Проверить статус таймера и службы с помощью следующих команд:
systemctl status monitor_test.timer
systemctl status monitor_test.service

Смотрим лог для проверки работы скрипта: tail -f /var/log/monitoring.log
