# go-rubezh

Простой backend на Go + Gin + PostgreSQL.

## Запуск

1. Установить зависимости:

```bash
go mod tidy
```

2. Поднять PostgreSQL и при необходимости задать строку подключения:

```bash
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable"
```

3. Запустить сервер:

```bash
go run main.go
```

Сервер стартует на `http://localhost:8080`.

## Проверка

```bash
curl http://localhost:8080/ping
```

Ожидается:

```json
{"message":"server is working"}
```

```bash
curl http://localhost:8080/users
```

Ожидается:

```json
[
  {"id":1,"name":"Ayan","email":"ayan@mail.com"},
  {"id":2,"name":"Madiyar","email":"madiyar@mail.com"},
  {"id":3,"name":"Dana","email":"dana@mail.com"}
]
```
