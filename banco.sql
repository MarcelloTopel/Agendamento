CREATE DATABASE agendamento;
USE agendamento;

CREATE TABLE Servicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

INSERT INTO Servicos (Nome) VALUES
('Consulta'),
('Ultrasson'),
('Raio-X'),
('Vacinação'),
('Cirurgia'),
('Exames Hematológicos');

CREATE TABLE Animais (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Idade INT CHECK (Idade >= 0),
    Peso DECIMAL(10,2) CHECK (Peso > 0),
    Tipo VARCHAR(20) NOT NULL,
    Tutor VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Horarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DiaSemana ENUM('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo') NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFim TIME NOT NULL,
    CHECK (HoraInicio < HoraFim)
);

INSERT INTO Horarios (DiaSemana, HoraInicio, HoraFim) VALUES
('Segunda', '14:00:00', '17:00:00'),
('Terça', '14:00:00', '17:00:00'),
('Quarta', '14:00:00', '17:00:00'),
('Quinta', '14:00:00', '17:00:00'),
('Sexta', '14:00:00', '17:00:00');

CREATE TABLE Agendamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    HorarioID INT NOT NULL,
    AnimalID INT NOT NULL,
    ServicoID INT NOT NULL,
    Confirmacao BOOLEAN NOT NULL,
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID),
    FOREIGN KEY (AnimalID) REFERENCES Animais(ID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ID),
    UNIQUE (Data, HorarioID, AnimalID)
);

CREATE TABLE Block (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    HorarioID INT NOT NULL,
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID),
    UNIQUE (Data, HorarioID)
);

-- Adicionar índices para melhorar a performance das consultas
CREATE INDEX idx_animal_nome ON Animais (Nome);
CREATE INDEX idx_tutor_nome ON Animais (Tutor);
CREATE INDEX idx_servico_nome ON Servicos (Nome);
CREATE INDEX idx_agendamento_data ON Agendamentos (Data);
CREATE INDEX idx_block_data ON Block (Data);


SELECT * FROM Servicos;
SELECT * FROM Animais;
SELECT * FROM Horarios;
SELECT * FROM Agendamentos;
SELECT * FROM Block;
