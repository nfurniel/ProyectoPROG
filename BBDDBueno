CREATE DATABASE laberintobueno;
-- Selecciona la base de datos
USE laberintobueno;

-- Elimina las tablas si existen, en orden correcto por dependencias
DROP TABLE IF EXISTS Puertas;
DROP TABLE IF EXISTS Ranking;
DROP TABLE IF EXISTS Disposiciones;  
DROP TABLE IF EXISTS Laberintos;
DROP TABLE IF EXISTS Preguntas;

CREATE TABLE Laberintos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dimension1 INT NOT NULL,
    dimension2 INT NOT NULL,
    cocodrilos INT DEFAULT 0,
    botiquines INT DEFAULT 0,
    dmgCocodrilo INT DEFAULT 25
);

CREATE TABLE Disposiciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_laberinto INT NOT NULL,
    FOREIGN KEY (id_laberinto) REFERENCES Laberintos(id) ON DELETE CASCADE
);

CREATE TABLE Puertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_disposicion INT NOT NULL,
    coord1 INT NOT NULL,
    coord2 INT NOT NULL,
    posicion INT NOT NULL,
    FOREIGN KEY (id_disposicion) REFERENCES Disposiciones(id) ON DELETE CASCADE
);

-- Crea la tabla Ranking
CREATE TABLE Ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) UNIQUE NOT NULL,
    vida INT,
    laberinto INT,
    disposicion INT,
    salida TINYINT(1),
    FOREIGN KEY (laberinto) REFERENCES Laberintos(id),
    FOREIGN KEY (disposicion) REFERENCES Disposiciones(id)
);

-- Crea la tabla Preguntas
CREATE TABLE Preguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta VARCHAR(255),
    respuesta VARCHAR(255)
);

-- Muestra las tablas creadas
SHOW TABLES;

DROP TABLE Preguntas;

-- Muestra la estructura de las tablas principales
DESCRIBE Laberintos;
DESCRIBE Disposiciones;
DESCRIBE Puertas;
DESCRIBE Ranking;
DESCRIBE Preguntas;

SELECT * FROM Laberintos;
SELECT * FROM Disposiciones;
SELECT * FROM Puertas;

SELECT * FROM ranking;
