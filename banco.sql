-- Criação do banco de dados
CREATE DATABASE agendamento;
USE agendamento;

-- Tabela de Serviços
CREATE TABLE Servicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
) COMMENT 'Tabela contendo os tipos de serviços oferecidos';

INSERT INTO Servicos (Nome) VALUES
('Consulta'),
('Ultrasson'),
('Raio-X'),
('Vacinação'),
('Cirurgia'),
('Exames Hematológicos');

-- Tabela de Animais
CREATE TABLE Animais (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Idade INT,
    Peso DECIMAL(10,2),
    Tipo VARCHAR(20),
    Tutor VARCHAR(100),
    Telefone VARCHAR(20)
) COMMENT 'Tabela contendo as informações dos animais';

-- Tabela de Horários
CREATE TABLE Horarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DiaSemana ENUM('Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado') NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFim TIME NOT NULL
) COMMENT 'Tabela contendo os horários disponíveis para agendamento';

INSERT INTO Horarios (DiaSemana, HoraInicio, HoraFim) VALUES
('Segunda', '14:00:00', '17:00:00'),
('Terça', '14:00:00', '17:00:00'),
('Quarta', '14:00:00', '17:00:00'),
('Quinta', '14:00:00', '17:00:00'),
('Sexta', '14:00:00', '17:00:00');

-- Tabela de Agendamentos
CREATE TABLE Agendamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    HorarioID INT NOT NULL,
    AnimalID INT NOT NULL,
    ServicoID INT NOT NULL,
    Confirmacao BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID),
    FOREIGN KEY (AnimalID) REFERENCES Animais(ID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ID)
) COMMENT 'Tabela contendo os agendamentos realizados';

-- Tabela de Bloqueios de Horários
CREATE TABLE Block (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    HorarioID INT NOT NULL,
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID)
) COMMENT 'Tabela contendo os horários bloqueados para agendamentos';

-- Criação de índices para melhorar a performance nas buscas
CREATE INDEX idx_data_horario ON Agendamentos (Data, HorarioID);
CREATE INDEX idx_data_block ON Block (Data, HorarioID);
