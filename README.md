# ЛР01 — Контейнеризация и Docker

## Метаданные студента

- **ФИО:** Ярмола Александр Олегович
- **Группа:** АС-63
- **№ студенческого/зачетной книжки:** 220028
- **Email:** as006325@g.bstu.by
- **GitHub username:** alexsandro007
- **Вариант №:** 23
- **Дата выполнения:** 02.10.2025
- **ОС:** Windows 10
- **Docker Desktop/Engine:** 28.1.1

---

## Состав работы

- `app/main.py` — исходный код Flask-сервиса
- `app/requirements.txt` — зависимости Python
- `Dockerfile` — multi-stage docker образ, метаданные и параметры
- `docker-compose.yml` — запуск Flask и Redis, volume, labels
- `.dockerignore` — список файлов и папок, которые игнорируются при сборке Docker-образа
- `README.md` — подробная инструкция по сборке, запуску и проверке работы, а также сведения о студенте и особенностях реализации

---

## Как собрать и запустить

1. Клонировать репозиторий:
   ```bash
   git clone https://github.com/alexsandro007/DS-CT_Lab1.git
   cd DS-CT_Lab1
   ```

2. Собрать и запустить проект:
   ```bash
   docker compose up --build
   ```

   Для запуска в фоне:
   ```bash
   docker compose up --build -d
   ```

3. Остановить проект:
   ```bash
   docker compose down
   ```

---

## Проверка работы

- Приложение будет доступно по адресу:
  [http://localhost:8043/](http://localhost:8043/)

- Healthcheck:
  [http://localhost:8043/live](http://localhost:8043/live)

- При каждом переходе на `/` увеличивается счетчик Redis c нужным префиксом ключа.

---

## Логи

Посмотреть логи приложения:
```bash
docker compose logs -f app
```

---

## Проверка Graceful Shutdown

1. Остановить приложение:
   ```bash
   docker compose stop
   ```
2. В логах появится строка:
   ```
   Received SIGTERM, shutting down gracefully...
   ```

---

## Особенности реализации

- Используется multi-stage build для минимального размера образа.
- Все параметры (имена образов, volume, контейнеров, лейблы, префиксы ключей Redis) соответствуют варианту и требованиям.
- ENV переменные `STU_ID`, `STU_GROUP`, `STU_VARIANT` используются в приложении и логах.
- Лейблы и именование ресурсов соответствуют методичке.