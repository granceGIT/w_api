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

## Просмотр проекта с данными:

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExa2ltenlndTA5M2J5bDZpNmtyYnlmajM3M2xka2JyNnh3ODRkdHR4ZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/g4ViVdvsPIxYyUJ4X3/giphy.gif)

### Чтобы просмотреть проект с данными необходимо выбрать ветку withData

1. Склонируйте репозиторий ``` git clone https://github.com/granceGIT/w_api . ```
2. Перейдите в ветку withData ```git checkout withData```
3. Установите зависимости ``` composer install ```
4. Создайте файл настроек конфигурации .env ``` cp .env.example .env ```
5. Создайте базу данных и обновите настройки подключения к ней в файле .env
6. Импортируйте скрипт базы данных в корне проекта в созданную базу данных
7. Далее понадобится создать public ссылку на storage для доступа к изображениям ``` php artisan storage:link ```
8. Запустите сервер ``` php artisan serve ```

<i>Для доступа к созданным аккаунтам пользуйтесь паролем <b>12345</b></i>
