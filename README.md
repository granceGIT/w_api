# W project api

### Проект реализован лишь частично

<i>Что должен из себя представлять: api для <a href="https://github.com/granceGIT/w_spa">W project spa на vuejs</a></i>

### Чтобы установить проект выполните ряд действий:

1. Склонируйте репозиторий ``` git clone https://github.com/granceGIT/w_api . ```
2. Установите зависимости ``` composer install ```
3. Создайте файл настроек конфигурации .env ``` cp .env.example .env ```
4. Создайте базу данных и обновите настройки подключения к ней в файле .env
5. Создайте и частично заполните таблицы с помощью существующих миграций ``` php artisan migrate --seed ```
6. Далее понадобится создать public ссылку на storage для доступа к изображениям ``` php artisan storage:link ```
7. Запустите сервер ``` php artisan serve ```
