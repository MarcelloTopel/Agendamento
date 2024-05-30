-- Criação do banco de dados com charset e collation definidos
CREATE DATABASE agendamento CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE agendamento;

-- Tabela de Serviços
CREATE TABLE Servicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
) COMMENT 'Tabela contendo os tipos de serviços oferecidos';

-- Inserção dos tipos de serviços
INSERT INTO Servicos (Nome) VALUES
('Consulta'),
('Ultrassom'),
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

-- Inserção dos horários disponíveis
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
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AnimalID) REFERENCES Animais(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'Tabela contendo os agendamentos realizados';

-- Tabela de Bloqueios de Horários
CREATE TABLE Block (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    HorarioID INT NOT NULL,
    FOREIGN KEY (HorarioID) REFERENCES Horarios(ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'Tabela contendo os horários bloqueados para agendamentos';

-- Criação de índices para melhorar a performance nas buscas
CREATE INDEX idx_data_horario ON Agendamentos (Data, HorarioID);
CREATE INDEX idx_data_block ON Block (Data, HorarioID);
