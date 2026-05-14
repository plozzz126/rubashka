# java-rubezh

Простой проект на Java с ООП-структурой, JDBC и записью в файл.

## Структура

```text
java-rubezh/
├── src/
│   ├── Main.java
│   ├── model/
│   │   └── User.java
│   ├── repository/
│   │   └── UserRepository.java
│   └── service/
│       ├── DatabaseService.java
│       └── FileService.java
├── pom.xml
├── schema.sql
└── users.txt
```

## Подготовка PostgreSQL

1. Создать базу:

```sql
CREATE DATABASE java_rubezh;
```

2. Запустить SQL из `schema.sql` (если хочешь вручную), либо просто запустить приложение: оно само создаст таблицу `users` и добавит тестовые данные.

## Переменные окружения (опционально)

По умолчанию используются:
- `DB_URL=jdbc:postgresql://localhost:5432/java_rubezh`
- `DB_USER=postgres`
- `DB_PASSWORD=postgres`

Можно переопределить:

```bash
export DB_URL="jdbc:postgresql://localhost:5432/java_rubezh"
export DB_USER="postgres"
export DB_PASSWORD="postgres"
```

## Запуск

```bash
mvn exec:java
```

Ожидаемо в консоли:

```text
Список пользователей из базы данных:
1 | Ayan | ayan@mail.com
2 | Dana | dana@mail.com
3 | Madiyar | madiyar@mail.com
Пользователи успешно записаны в файл: users.txt
```
