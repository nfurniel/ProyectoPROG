CREATE DATABASE IF NOT EXISTS TrabajoProg;
USE TrabajoProg;
CREATE TABLE Laberintos (
	id INT PRIMARY KEY,
    dimension1 INT,
    dimension2 INT,
    cocodrilos INT,
    botiquines INT,
    dmgCocodrilo INT DEFAULT 25,
    tiempoPregunta INT DEFAULT 30,
    dmgPregunta INT DEFAULT 10
);
CREATE TABLE Disposiciones (
	id INT PRIMARY KEY,
    id_laberinto INT,
    FOREIGN KEY (id_laberinto) REFERENCES Laberintos(id)
);
CREATE TABLE Puertas (
	id INT PRIMARY KEY,
    id_disposicion INT,
    coord1 INT,
    coord2 INT,
    posicion INT,
    FOREIGN KEY (id_disposicion) REFERENCES Disposiciones(id)
);
CREATE TABLE Ranking (
	id INT PRIMARY KEY,
	Usuario VARCHAR(100) UNIQUE NOT NULL,
    vida INT,
    laberinto INT,
    disposicion INT,
    salida TINYINT(1),
    FOREIGN KEY (Laberinto) REFERENCES Laberintos(id),
	FOREIGN KEY (Disposicion) REFERENCES Disposiciones(id)
);