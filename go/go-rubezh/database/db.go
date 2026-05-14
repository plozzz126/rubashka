package database

import (
	"database/sql"
	"os"

	_ "github.com/jackc/pgx/v5/stdlib"
)

const defaultDSN = "postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable"

func Connect() (*sql.DB, error) {
	dsn := os.Getenv("DATABASE_URL")
	if dsn == "" {
		dsn = defaultDSN
	}

	db, err := sql.Open("pgx", dsn)
	if err != nil {
		return nil, err
	}

	if err := db.Ping(); err != nil {
		db.Close()
		return nil, err
	}

	return db, nil
}

func InitSchema(db *sql.DB) error {
	createTableQuery := `
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE
);`

	if _, err := db.Exec(createTableQuery); err != nil {
		return err
	}

	seedUsersQuery := `
INSERT INTO users (name, email) VALUES
	('Ayan', 'ayan@mail.com'),
	('Madiyar', 'madiyar@mail.com'),
	('Dana', 'dana@mail.com')
ON CONFLICT (email) DO NOTHING;`

	if _, err := db.Exec(seedUsersQuery); err != nil {
		return err
	}

	return nil
}
