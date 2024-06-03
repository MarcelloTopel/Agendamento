-- Criação do banco de dados
CREATE DATABASE agendamento;
USE agendamento;

CREATE TABLE Pessoa (
    idP INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE Animal (
    idAnimal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    peso DOUBLE
);

INSERT INTO Pessoa (nome, idade) VALUES ('Nome1', 30), ('Nome2', 25);

INSERT INTO Animal (nome, idade, peso) VALUES ('Animal1', 5, 10.5), ('Animal2', 3, 8.2);
