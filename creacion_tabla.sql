-- Crear tabla de libros
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    author_id INTEGER UNSIGNED,
    title VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    `language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER NOT NULL DEFAULT 1,
    `description` TEXT
);
-- Crear tabla de autores
CREATE TABLE IF NOT EXISTS authors(
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    nationality VARCHAR(3)
);
-- Crear tabla de clientes 
CREATE TABLE clients (
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Crear tabla de operaciones
CREATE TABLE IF NOT EXISTS operations(
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED,
    client_id INTEGER UNSIGNED,
    `type` ENUM('Borrowed', 'Returned', 'Sold') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT(1) NOT NULL DEFAULT 0
);
-- Insertar autores
INSERT INTO authors(author_id, name, nationality)
VALUES (1, 'Juan Rulfo', 'MEX');

INSERT INTO authors(name, nationality)
VALUES('Gabriel Garcia Marquez', 'COL');

INSERT INTO authors
VALUES(3, 'Juan Gabriel Vazquez', 'COL');

INSERT INTO authors(name, nationality)
VALUES('Julio Cortazar', 'ARG'),
('Isabel Allende', 'CHI'),
('Octavio Paz', 'MEX'),
('Juan Carlos Onetti', 'URU');

INSERT INTO authors(author_id, name)
VALUES (16, 'Pablo Neruda');

-- insertar clientes

INSERT INTO clients(client_id, name,email, birthdate,gender, active) VALUES
(1, 'Maria Dolores Gomez', 'Maria Dolores.9583222J@random.names', '1971-06-06', 'F', 1),
(2, 'Adrian Fernandez', 'Adrian.55818851J@random.names', '1970-04-09', 'M', 1),
(3, 'Maria Luisa marin', 'Maria Luisa.83726282A@random.names', '1957-07-30', 'F', 1),
(4, 'Pedro Sanchez', 'Pedro.78522059J@random.names', '1992-01-31', 'M', 1);

-- Pasando uno de los clientes de activo a inactivo
INSERT INTO clients(name, email, birthdate,gender, active) VALUES 
('Maria Dolores Gomez', 'Maria Dolores.9583222J@random.names', '1971-06-06', 'F', 0)
ON DUPLICATE KEY UPDATE active = VALUES(active);

-- Crear libro
-- El laberinto de la Soledad, Octavio Paz, 1900

INSERT INTO books(title, author_id) VALUES
('El laberinto de la Soledad', 6);

-- Crear libro
-- Vuelta al laberinto de la Soledad, Octavio Paz, 1960

INSERT INTO books(title, author_id, `year`) VALUES
('Vuelta al laberinto de la Soledad', (SELECT author_id FROM authors WHERE name = 'Octavio Paz' LIMIT 1),1960);