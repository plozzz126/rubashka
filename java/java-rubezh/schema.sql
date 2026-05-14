CREATE DATABASE java_rubezh;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO users (name, email) VALUES
('Ayan', 'ayan@mail.com'),
('Dana', 'dana@mail.com'),
('Madiyar', 'madiyar@mail.com');
