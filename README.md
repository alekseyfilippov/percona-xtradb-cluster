# percona-xtradb-cluster
Test work

Не выполнено - перевод MYSQL под управление systemd, по-прежнему запускается как демон.
Не реализовано до конца обновление конфигурации pmm-агента и регистрация MYSQL на PMM сервере (сама нода регистрируется и первичные настройки агент получает). Необходимо вручную после поднятия контейнеров зайти на каждую ноду и выполнить следующие команды:
 1) sudo  pmm-agent --config-file=/pmm-agent.yaml
 2) открыть новую сессию терминала и в ней выполнить
 sudo pmm-admin add mysql --username=root --password=root --tls --tls-skip-verify --service-name="$MYSQL_NODE_NAME" --host=127.0.0.1 --port=3306.
 
После этого пойдут метрики на PMM-сервер, открывается по lockalhost:81, логин/пароль оставить admin/admin (в  переменную не выделен, используется при регистрации ноды).
 

В общем случае я бы скорее взял готовый образ от вендора и работал с ним, без замены ОС и каких-то подкапотных вещей. Спасибо за интересное задание.
