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

-- sentencia para ejecutar en la base de datos de pruebaplatzi que traiga y busque nombre, email, año de nacimiento y genero de todas las personas que en su apellido tengan la palbra Dolor

SELECT name, email, YEAR(NOW()) - YEAR(birthdate), gender
FROM clients
WHERE name LIKE '%Dolor%';

-- sentencia para ejecutar en la base de datos de pruebaplatzi que traiga y busque nombre, email, año de nacimiento y genero de todas las personas que en su apellido tengan la palbra Lop

SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS Edad_Actual, gender
FROM clients
WHERE gender = 'F'
AND `name` LIKE '%Lop%';


-- Sentencia usando JOIN para traer id del libro, nombre y titulo del autor

SELECT b.book_id, a.name, a.author_id, b.title
FROM books AS b
JOIN authors AS a
ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;

-- Sentencia para modificar la columna type en la tabla de transacciones

INSERT INTO transactions(transaction_id, book_id, client_id, `type`, `finished`) 
VALUES(1, 12, 34, 'sell', 1),
(2, 54, 87, 'lend', 0),
(3, 3, 14, 'sell', 1),
(4, 1, 54, 'sell', 1),
(5, 12, 81, 'lend', 1),
(6, 12, 81, 'return', 1),
(7, 87, 29, 'sell', 1);


-- Sentencia para agregar datos a la tabla de transacciones

INSERT INTO transactions(transaction_id, book_id, client_id, `type`, `finished`) 
VALUES(1, 12, 34, 'sell', 1),
(2, 54, 87, 'lend', 0),
(3, 3, 14, 'sell', 1),
(4, 1, 54, 'sell', 1),
(5, 12, 81, 'lend', 1),
(6, 12, 81, 'return', 1),
(7, 87, 29, 'sell', 1);

-- Sentencia para unir las tablas de transacciones, libros y clientes con JOIN sin condiciones

SELECT c.name, b.title, t.type
FROM transactions AS t
JOIN books AS b
ON t.book_id = b.book_id
JOIN clients AS c
ON t.client_id = c.client_id;

-- Sentencia para unir las tablas de transacciones, libros y clientes con JOIN con condiciones

SELECT c.name, b.title, t.type
FROM transactions AS t
JOIN books AS b
ON t.book_id = b.book_id
JOIN clients AS c
ON t.client_id = c.client_id
WHERE c.gender = 'F'
AND t.TYPE = 'sell';

-- Sentencia para unir las tablas de transacciones, libros, clientes y autores con JOIN con condiciones

SELECT c.name AS client, b.title , a.name AS author, t.type 
FROM transactions AS t
JOIN books AS b
ON t.book_id = b.book_id
JOIN clients AS c
ON t.client_id = c.client_id
JOIN authors AS a
ON b.author_id = a.author_id
WHERE c.gender = 'F'
AND t.TYPE = 'sell';

-- 

SELECT c.name AS client, b.title , a.name AS author, t.type 
FROM transactions AS t
JOIN books AS b
ON t.book_id = b.book_id
JOIN clients AS c
ON t.client_id = c.client_id
JOIN authors AS a
ON b.author_id = a.author_id
WHERE c.gender = 'M'
AND t.TYPE IN ('sell', 'lend');


-- Traer todos los libros y el nombre del autor utilizando JOIN implicito
 
SELECT b.title, a.name
FROM authors AS a, books AS b
WHERE a.author_id = b.author_id;

-- Traer 10 los libros y el nombre del autor utilizando JOIN implicito

SELECT b.title, a.name
FROM authors AS a, books AS b
WHERE a.author_id = b.author_id
LIMIT 10;

-- Traer 10 los libros y el nombre del autor utilizando JOIN explicito

SELECT b.title, a.name
FROM books AS b
INNER JOIN authors AS a
ON a.author_id = b.author_id
LIMIT 10;

-- Traer id, nombre, nacionalidad y libro de los primeros 5 autores con JOIN explicito

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id;

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.name ASC;

-- Traer id, nombre, nacionalidad y libro de los primeros 5 autores con LEFT JOIN explicito

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
LEFT JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;

-- Agrupando y utilizando la sentencia GROUP BY con LEFT JOIN

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id)
FROM authors AS a
LEFT JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id;

-- Agrupando y utilizando la sentencia GROUP BY con INNER JOIN

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id)
FROM authors AS a
INNER JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id;

1. ¿Qué nacionalidades hay?

SELECT nationality FROM authors;

SELECT DISTINCT nationality FROM authors;

2. ¿Cuántos escritores hay de cada nacionalidad?

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
GROUP BY nationality
ORDER BY c_authors DESC, nationality;

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY c_authors DESC, nationality;

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
AND nationality <> 'RUS'
GROUP BY nationality
ORDER BY c_authors DESC, nationality;

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
AND nationality NOT IN('RUS', 'ENG')
GROUP BY nationality
ORDER BY c_authors DESC, nationality;


SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
AND nationality IN ('RUS', 'ENG')
GROUP BY nationality
ORDER BY c_authors DESC, nationality;