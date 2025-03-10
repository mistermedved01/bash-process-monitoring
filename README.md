1. Создадим скрипт: /usr/local/bin/monitor_test.sh

2. Делаем скрипт исполняемым: chmod +x /usr/local/bin/monitor_test.sh

3. Создадим systemd-юнит: /etc/systemd/system/monitor_test.service

4. Для выполнения скрипта каждую минуту создадим systemd-таймер: /etc/systemd/system/monitor_test.timer

5. Активируем и запустим таймер: 

- systemctl enable monitor_test.timer 
- systemctl start monitor_test.timer


6. Проверить статус таймера и службы с помощью следующих команд:

- systemctl status monitor_test.timer

- systemctl status monitor_test.service

7. Смотрим лог для проверки работы скрипта: tail -f /var/log/monitoring.log
